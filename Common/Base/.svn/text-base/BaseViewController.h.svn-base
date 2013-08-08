//
//  BaseShowWaitViewController_iPhone.h
//
//  Created by imac on 12-7-27.
//  Copyright (c) 2012年 Twin-Fish. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppCore.h"
#import "AppDelegate_iphone.h"
#import "MBProgressHUD.h"
#import "EGORefreshTableHeaderView.h"


@interface BaseViewController : UIViewController<EGORefreshTableHeaderDelegate, UIGestureRecognizerDelegate>
{
    
    MBProgressHUD *_hud;
    
    BOOL    _reloading;
    EGORefreshTableHeaderView *refreshTableHeaderView;
    EGORefreshTableHeaderView *refreshTableFootView;

}

//@property (nonatomic, retain) UIWindow *backgroundWindow;
//@property (nonatomic, retain) UIView   *backgroundView;

//- (void)changeNavigationBarStyle;
//
//- (void)showFullScreenWaitingView;
//- (void)hideFullScreenWaitingView;
//
//- (void)showWaitingView;
//- (void)hideWaitingView;


@property (nonatomic, readonly) MBProgressHUD* hud;

-(void)showHud;
-(void)hideHud;
-(void)showHudWithMsg:(NSString*)msg;


- (void)initView;
- (void)resetView;
- (void)hideKeyboard;

@end
