
#import <UIKit/UIKit.h>


@class BaseSplashScreen;
@protocol SplashScreenDelegate <NSObject>

@optional
- (void)splashScreenDidAppear:(BaseSplashScreen *)splashScreen;
- (void)splashScreenWillDisappear:(BaseSplashScreen *)splashScreen;
- (void)splashScreenDidDisappear:(BaseSplashScreen *)splashScreen;

@end

@interface BaseSplashScreen : UIViewController {}

@property (nonatomic, retain) UIImage *splashImage;
@property (nonatomic, assign) id<SplashScreenDelegate> delegate;

- (void)hide;

@end



