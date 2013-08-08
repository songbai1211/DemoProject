//
//  AppDelegate.h
//  DemoProject
//
//  Created by apple on 13-6-2.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseAppDelegate.h"
#import "UserInfoFactory.h"

@interface AppDelegate_iphone : BaseAppDelegate
{
@private
    Reachability *_wifiReachability;
    NetworkStatus _lastNetStatus;
}

@property (retain, nonatomic)IBOutlet UIWindow *window;
@property (retain, nonatomic)IIViewDeckController *deckViewController;

@end

void uncaughtExceptionHandler(NSException *exception);
void stacktrace(int sig, siginfo_t *info, void *context);





