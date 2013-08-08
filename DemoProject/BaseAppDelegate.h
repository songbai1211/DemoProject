//
//  baseAppDelegate.h
//
//  Created by apple on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AppCore.h"
#include <execinfo.h> 


@interface BaseAppDelegate : NSObject<UIApplicationDelegate, MBProgressHUDDelegate>
{
    MBProgressHUD *_HUD;
}

@property(nonatomic, retain)MBProgressHUD *HUD;


- (void)showHUD;
- (void)hideHUD;
- (void)showHUDWithTitle:(NSString*)title yOffset:(CGFloat)yOffset;
- (void)showHUDWithToostTitle:(NSString *)title yOffset:(CGFloat)yOffset;



@end
