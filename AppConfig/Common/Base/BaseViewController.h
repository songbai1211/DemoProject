//
//  BaseShowWaitViewController_iPhone.h
//
//  Created by imac on 12-7-27.
//  Copyright (c) 2012年 Twin-Fish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"


@interface BaseViewController : UIViewController<UIAlertViewDelegate> {
    /* View frame */
    CGRect viewFrame;
    UIButton *leftButton;
    UIButton *rightButton;
}

@property (nonatomic, retain) UIWindow *backgroundWindow;
@property (nonatomic, retain) UIView   *backgroundView;
@property (nonatomic, retain) MBProgressHUD* hud;

- (id)initWithFrame:(CGRect)frame;

- (void)changeNavigationBarStyle;

- (void)showFullScreenWaitingView;
- (void)hideFullScreenWaitingView;

- (void)showWaitingView;
- (void)hideWaitingView;

-(void)showHud;
-(void)hideHud;
-(void)showHudWithMsg:(NSString*)msg;


@end
