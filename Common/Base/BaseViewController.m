//
//  BaseShowWaitViewController_iPhone.h

//
//  Created by imac on 12-7-27.
//  Copyright (c) 2012年 Twin-Fish. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end


@implementation BaseViewController

//@synthesize backgroundWindow;
//@synthesize backgroundView;

@dynamic hud;

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


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
  
}

#pragma mark - Orientation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark iOS 6

- (BOOL)shouldAutorotate {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationPortrait;
}



-(void)showHud
{
    self.hud.mode       = MBProgressHUDModeIndeterminate;
    self.hud.labelText  = @"";
    [self.hud show:YES];
}

-(void)hideHud
{
    [self.hud hide:YES];
}

-(void)showHudWithMsg:(NSString*)msg
{
    self.hud.mode       = MBProgressHUDModeText;
    self.hud.labelText  = msg;
    [self.hud show:YES];
    [self.hud hide:YES afterDelay:2.0];
}

- (void)initView
{
    //重写
}

- (void)resetView
{
    //重写
}


//收起键盘
- (void)hideKeyboard
{
    //重写
}

//
//#pragma mark - WaitView
//
//- (void)showFullScreenWaitingView
//{
//    if (self.backgroundWindow == nil) {
//        CGRect frame = [UIScreen mainScreen].bounds;
//        UIView *bgView = [[UIView alloc]initWithFrame:frame];
//        bgView.backgroundColor = [UIColor blackColor];
//        bgView.alpha = 0.5;
//        
//        
//        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((CGRectGetWidth(frame) - 37) / 2 , (CGRectGetHeight(frame) - 37) / 2, 37, 37)];
//        [activityView startAnimating];
//        
//        [bgView addSubview:activityView];
//        self.backgroundWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        self.backgroundWindow.windowLevel = UIWindowLevelAlert;
//        [self.backgroundWindow addSubview:bgView];
//        [self.backgroundWindow makeKeyAndVisible];
//        
//    }
//    else {
//        NSLog(@"%s (%u):already have waiting view", __FUNCTION__, __LINE__);
//    }
//}
//
//- (void)hideFullScreenWaitingView
//{
//    if (self.backgroundWindow != nil) {
//        self.backgroundWindow.rootViewController = nil;
//        self.backgroundWindow = nil;
//    }
//}
//
//
//- (void)showWaitingView
//{
//    //开始等待动画
//    if (self.backgroundView == nil) {
//        
//        self.backgroundView = [[UIView alloc] initWithFrame:[self.view bounds]];
//        [self.backgroundView setBackgroundColor:RGBACOLOR(0, 0, 0, 0.5)];
//        
//        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//        activityView.frame = CGRectMake(0, 0, 37, 37);
//        activityView.center = self.backgroundView.center;
//        
//        [self.backgroundView addSubview:activityView];
//        [self.view addSubview:self.backgroundView];
//        [activityView startAnimating];
//        
//    } else {
//        NSLog(@"%s (%u):already have waiting view", __FUNCTION__, __LINE__);
//    }
//}
//
//- (void)hideWaitingView
//{
//    //结束动画
//    if (self.backgroundView) {
//        [self.backgroundView removeFromSuperview];
//        self.backgroundView = nil;
//    }
//}
//
//
//
//#pragma mark - UIAlertViewDelegate
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    switch (alertView.tag) {
//
//        default:
//            break;
//    }
//}




- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([[touch view] isKindOfClass:[UITextField class]] ||
        [[touch view] isKindOfClass:[UIButton class]]) {
        return NO;
    }
    
    else {
        return YES;
    }
}


#pragma mark Data Source Loading / Reloading Method
- (void)moreTableViewDataSource:(BOOL)isPull{
    
    _reloading = YES;
}

- (void)reloadTableViewDataSource:(BOOL)isPull{
	
    _reloading = YES;
}

- (void)doneLoadingTableViewData{
	
	_reloading = NO;
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
	[refreshTableFootView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [refreshTableFootView egoRefreshScrollViewDidEndDragging:scrollView];
}

@end
