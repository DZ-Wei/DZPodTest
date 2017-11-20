//
//  YvTimerManager.h
//
//  Created by mac2016 on 2017/6/20.
//

#import <Foundation/Foundation.h>

@interface YvTrafficTimerManager : NSObject

+ (instancetype)sharedInstance;

/**
 start:开始时间,0代表马上执行
 intervals:间隔执行时间
 duration:总共执行时间
 */
+ (void)dz_timerWith:(NSTimeInterval)start timerTarget:(id)target timerInterval:(NSTimeInterval)intervals timerDuration:(NSTimeInterval)duration eventHandler:(void(^)(BOOL isTimeOut))block;

+ (void)timerCancel;



@end
