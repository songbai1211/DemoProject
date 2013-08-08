

#import "BaseSplashScreen.h"
#import "AppCore.h"

@implementation BaseSplashScreen

@synthesize splashImage;
@synthesize delegate;


- (UIImage *)splashImage {
    if (splashImage == nil) {

        self.splashImage = [UIImage imageNamedNoCache:@"Default.png"];
    }
    return splashImage;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.splashImage = nil;
}

- (void)loadView {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:self.splashImage];
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    self.view = imgView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏状态栏和导航栏
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)hide {
    
    //显示状态栏
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(splashScreenWillDisappear:)]) {
        [self.delegate splashScreenWillDisappear:self];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(splashScreenDidDisappear:)]) {
        [self.delegate splashScreenDidDisappear:self];
    }
}


@end
