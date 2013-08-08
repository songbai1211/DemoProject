//
//  baseAppDelegate.m
//
//  Created by apple on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "BaseAppDelegate.h"


@implementation BaseAppDelegate

@synthesize HUD;

- (MBProgressHUD *) HUD{
	if (!_HUD) {
        
		_HUD = [[MBProgressHUD alloc] initWithView:[[UIApplication sharedApplication] keyWindow]];
		_HUD.animationType = MBProgressHUDAnimationZoom;
		_HUD.delegate = self;
		[[[UIApplication sharedApplication] keyWindow] addSubview:_HUD];
	}
	return _HUD;
}


#pragma mark - HUD Method

- (void)showHUD
{
    self.HUD.mode       = MBProgressHUDModeIndeterminate;
    self.HUD.labelText  = @"";
    [self.HUD show:YES];
}

- (void)hideHUD
{
    [self.HUD hide:YES];
    
}

- (void)showHUDWithTitle:(NSString*)title yOffset:(CGFloat)yOffset
{
    self.HUD.mode       = MBProgressHUDModeIndeterminate;
    self.HUD.labelText  = title;
    [self.HUD show:YES];
}

- (void)showHUDWithToostTitle:(NSString *)title yOffset:(CGFloat)yOffset
{
    self.HUD.mode       = MBProgressHUDModeText;
    self.HUD.labelText  = title;
	self.HUD.yOffset    = yOffset;
	[self.HUD show:YES];
    [self.HUD hide:YES afterDelay:2.0];
}




@end

 