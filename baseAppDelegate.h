//
//  baseAppDelegate.h
//  MMeeting
//
//  Created by apple on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AppCore.h"
#include <execinfo.h> 


@interface BaseAppDelegate : NSObject<UIApplicationDelegate>
{

}

@property(nonatomic, assign)NSInteger appLanchType;


- (void)initMMeeting;
- (void)readConfig;
- (void)processException:(NSException *)exception;
- (BOOL)hasCrashed;
- (void)setCrashFlag;
- (void)clearCrashFlag;

- (void)SignalHandler;

@end

void uncaughtExceptionHandler(NSException *exception);
void stacktrace(int sig, siginfo_t *info, void *context);