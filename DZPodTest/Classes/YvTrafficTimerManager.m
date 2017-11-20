//
//  YvTimerManager.m
//
//  Created by mac2016 on 2017/6/20.
//

#import "YvTrafficTimerManager.h"

static dispatch_source_t dz_timer;
static dispatch_once_t once;
static YvTrafficTimerManager *__instance = nil;

@interface YvTrafficTimerManager ()

@end

@implementation YvTrafficTimerManager

+ (instancetype)sharedInstance
{
    dispatch_once(&once, ^{
        __instance = [[YvTrafficTimerManager alloc] init];
    });
    return __instance;
}

+(void)dz_timerWith:(NSTimeInterval)start timerTarget:(id)target timerInterval:(NSTimeInterval)intervals timerDuration:(NSTimeInterval)duration eventHandler:(void(^)(BOOL isTimeOut))block
{
    [self timerCancel];
    __weak typeof(&*target)weakSelf = target;
    target = nil;
    if (!block) return;
    int run_count = duration/intervals;
    __block int run_number = 0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dz_timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(dz_timer, DISPATCH_TIME_NOW, intervals*NSEC_PER_SEC, 0.1*NSEC_PER_SEC);
    dispatch_source_set_event_handler(dz_timer, ^
    {
        if (!weakSelf || run_number > run_count) {
            dispatch_source_cancel(dz_timer);
        }else{
            //获取主线程
            dispatch_sync(dispatch_get_main_queue(), ^{
                block(run_number==run_count);
            });
        }
        run_number++;
    });
    
    if (start) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(start * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
        {
            dispatch_resume(dz_timer);
        });
    }else{
        dispatch_resume(dz_timer);
    }
}

+ (void)timerCancel
{
    if (!dz_timer) return;
    dispatch_source_cancel(dz_timer);
}

@end
