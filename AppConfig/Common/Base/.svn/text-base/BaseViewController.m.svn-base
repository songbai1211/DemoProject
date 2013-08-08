//
//  BaseShowWaitViewController_iPhone.h

//
//  Created by imac on 12-7-27.
//  Copyright (c) 2012年 Twin-Fish. All rights reserved.
//

#import "AppMacros.h"
#import "BaseViewController.h"


@interface BaseViewController ()

@end


@implementation BaseViewController

@synthesize backgroundWindow;
@synthesize backgroundView;

- (MBProgressHUD*)hud
{
    if (!_hud) {
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:_hud];
    }
    return _hud;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self != nil) {
        viewFrame = frame;
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self changeNavigationBarStyle];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	switch (interfaceOrientation) {
        case UIDeviceOrientationPortrait:
            return YES;       
        default:
            return NO;
    }
}

- (void)changeNavigationBarStyle
{
    //overwrite
}



#pragma mark - WaitView

- (void)showFullScreenWaitingView
{
    if (self.backgroundWindow == nil) {
        CGRect frame = [UIScreen mainScreen].bounds;
        UIView *bgView = [[UIView alloc]initWithFrame:frame];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = 0.5;
        
        
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((CGRectGetWidth(frame) - 37) / 2 , (CGRectGetHeight(frame) - 37) / 2, 37, 37)];
        [activityView startAnimating];
        
        [bgView addSubview:activityView];
        self.backgroundWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.backgroundWindow.windowLevel = UIWindowLevelAlert;
        [self.backgroundWindow addSubview:bgView];
        [self.backgroundWindow makeKeyAndVisible];
        
    }
    else {
        NSLog(@"%s (%u):already have waiting view", __FUNCTION__, __LINE__);
    }
}

- (void)hideFullScreenWaitingView
{
    if (self.backgroundWindow != nil) {
        self.backgroundWindow.rootViewController = nil;
        self.backgroundWindow = nil;
    }
}


- (void)showWaitingView
{
    //开始等待动画
    if (self.backgroundView == nil) {
        
        self.backgroundView = [[UIView alloc] initWithFrame:[self.view bounds]];
        [self.backgroundView setBackgroundColor:RGBACOLOR(0, 0, 0, 0.5)];
        
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        activityView.frame = CGRectMake(0, 0, 37, 37);
        activityView.center = self.backgroundView.center;
        
        [self.backgroundView addSubview:activityView];
        [self.view addSubview:self.backgroundView];
        [activityView startAnimating];
        
    } else {
        NSLog(@"%s (%u):already have waiting view", __FUNCTION__, __LINE__);
    }
}

- (void)hideWaitingView
{
    //结束动画
    if (self.backgroundView) {
        [self.backgroundView removeFromSuperview];
        self.backgroundView = nil;
    }
}


-(void)showHud
{
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelText = @"";
    [self.hud show:YES];
}

-(void)hideHud
{
    [self.hud hide:YES];
}

-(void)showHudWithMsg:(NSString*)msg 
{
    self.hud.mode = MBProgressHUDModeText;
    self.hud.labelText = msg;
    [self.hud show:YES];
    [self.hud hide:YES afterDelay:2.0];
}



#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (alertView.tag) {

        default:
            break;
    }
}

@end
