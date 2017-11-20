//
//  DZViewController.m
//  DZPodTest
//
//  Created by DZ-Wei on 11/20/2017.
//  Copyright (c) 2017 DZ-Wei. All rights reserved.
//

#import "DZViewController.h"
#import "YvTrafficTimerManager.h"

@interface DZViewController ()

@end

@implementation DZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [YvTrafficTimerManager dz_timerWith:0 timerTarget:self timerInterval:2 timerDuration:60 eventHandler:^(BOOL isTimeOut)
    {
        NSLog(@"call back timer hander");
    }];
}


@end
