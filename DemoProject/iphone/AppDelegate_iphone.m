//
//  AppDelegate.m
//  DemoProject
//
//  Created by apple on 13-6-2.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "AppDelegate_iphone.h"


@interface AppDelegate_iphone (Private)

- (void)reachabilityChanged:(NSNotification* )note;
- (void)signalHandler;

@end

@implementation AppDelegate_iphone
@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    //注册异常捕获函数
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    [self signalHandler];
    
    /*注册网络状态改变的回调函数，并开启监听网络状态改变*/
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    _wifiReachability = [Reachability reachabilityForLocalWiFi];
    _lastNetStatus    = [_wifiReachability currentReachabilityStatus];
    [_wifiReachability startNotifier];
    
    if ((launchOptions != nil) && ([launchOptions objectForKey:@"UIApplicationLaunchOptionsURLKey"] != nil)) {
       
        //URL启动
    } else {

        //正常启动
    }
    
    [MagicalRecord setupCoreDataStack];
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:NO];

    UIViewController        *centerViewController = nil;
    UIViewController        *leftViewController = nil;
    UINavigationController  *navigation = nil;

    centerViewController = [[UIViewController alloc] init];
    leftViewController = [[UIViewController alloc] init];
    navigation = [[UINavigationController alloc] initWithRootViewController:centerViewController];
    
    IIViewDeckController *deckVC = [[IIViewDeckController alloc] initWithCenterViewController:navigation
                                                                           leftViewController:leftViewController];
    deckVC.leftSize = self.window.width - (320 - 44.0);
    self.deckViewController = deckVC;
    self.window.rootViewController = self.deckViewController;
    [navigation setNavigationBarHidden:YES];
    [self.window makeKeyAndVisible];
    
    //启动动画
    UIImageView *splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    splashView.image = [UIImage  imageNamedNoCache:@"Default.png"];
    [self.window addSubview:splashView];
    [self.window bringSubviewToFront:splashView];
    
    splashView.animationImages = [NSArray arrayWithObjects:
                                  [UIImage imageNamedNoCache:@"Default.png"],
                                  [UIImage imageNamedNoCache:@"Default.png"],
                                  [UIImage imageNamedNoCache:@"Default.png"],
                                  [UIImage imageNamedNoCache:@"Default.png"],
                                  nil];
    splashView.animationDuration = 1.75;
    splashView.animationRepeatCount = 0;
    [splashView startAnimating];
    [splashView removeFromSuperview];

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"MMeeting App started with URL...");
    NSCharacterSet *delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSScanner *scanner = [[NSScanner alloc] initWithString:[url query]];
    
    /*解析URL中参数*/
    while (![scanner isAtEnd]) {
        NSString *pairStr = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairStr];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        
        NSArray *kvPair = [pairStr componentsSeparatedByString:@"="];
        if (kvPair.count == 2) {
            NSString *key   = [[kvPair objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSString *value = [[kvPair objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [params setObject:value forKey:key];
        }
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    
}   

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}




#pragma mark - Private

/*WIFI网络状态改变时被回调*/
- (void)reachabilityChanged:(NSNotification* )note
{
	@synchronized(_wifiReachability) {
        
        Reachability* curReach = [note object];
        if ([curReach isKindOfClass:[Reachability class]] == NO) {
            MMLogDebug(@"found unknown class object");
        }
        
        if (_wifiReachability == nil)
            return;
        
        if (_lastNetStatus != ReachableViaWiFi) {
            MMLogDebug(@"ignore this net status notification.");
        }
        
        if ([_wifiReachability currentReachabilityStatus] == NotReachable && _lastNetStatus != [_wifiReachability currentReachabilityStatus]) {
            MMLogDebug(@"Network disconnected.");
        } else {
            MMLogDebug(@"Network connection status changed (%u)", _lastNetStatus);
        }
        _lastNetStatus = [_wifiReachability currentReachabilityStatus];
    }
}

- (void)signalHandler
{
    struct sigaction mySigAction;
    mySigAction.sa_sigaction = stacktrace;
    mySigAction.sa_flags = SA_SIGINFO;
    
    sigemptyset(&mySigAction.sa_mask);
    sigaction(SIGQUIT, &mySigAction, NULL);
    sigaction(SIGILL , &mySigAction, NULL);
    sigaction(SIGTRAP, &mySigAction, NULL);
    sigaction(SIGABRT, &mySigAction, NULL);
    sigaction(SIGEMT , &mySigAction, NULL);
    sigaction(SIGFPE , &mySigAction, NULL);
    sigaction(SIGBUS , &mySigAction, NULL);
    sigaction(SIGSEGV, &mySigAction, NULL);
    sigaction(SIGSYS , &mySigAction, NULL);
    sigaction(SIGPIPE, &mySigAction, NULL);
    sigaction(SIGALRM, &mySigAction, NULL);
    sigaction(SIGXCPU, &mySigAction, NULL);
    sigaction(SIGXFSZ, &mySigAction, NULL);
}


@end

#pragma mark - other

void uncaughtExceptionHandler(NSException *exception)
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *curDate = [NSDate date];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *exceptionInfo = [NSString stringWithFormat:@"current time: %@\n exception name: %@\n exception reason: %@\n exception userinfo: %@\n Stack Trace: %@",
                               [formatter stringFromDate:curDate],
                               [exception name],
                               [exception reason],
                               [exception userInfo],
                               [exception callStackSymbols]];
    
    /*创建crash文件目录*/
    NSString *crashLogDirPath = [[NSFileManager docPath] stringByAppendingPathComponent:@"log"];
    crashLogDirPath           = [NSFileManager touch:crashLogDirPath];
    
    
    /*打开crash文件*/
    NSString *crashFileName = [NSString stringWithFormat:@"%@/crashreport.txt", crashLogDirPath];
    FILE *fd = fopen([crashFileName UTF8String], "w+");
    if (fd == NULL) {
        NSLog(@"open log file failed.");
        return;
    }
    
    /*写crash信息到文件中*/
    fputs([exceptionInfo UTF8String], fd);
    fputs("\r\n", fd);
    fflush(fd);
    fclose(fd);

}

void stacktrace(int sig, siginfo_t *info, void *context)
{
    NSError *error ;
    NSFileManager *fileManager =[NSFileManager defaultManager];
    NSMutableString *mstr = [[NSMutableString alloc] initWithCapacity:128];
    
    NSString *crashReportPath = [[NSFileManager docPath] stringByAppendingString:@"/log/crashreport.txt"];
    
    //如果crash文件已经存在，则将日志追加到文件里
    if ([fileManager fileExistsAtPath:crashReportPath])
    {
        NSString *existCrashReport = [NSString stringWithContentsOfFile:crashReportPath encoding:NSUTF8StringEncoding error:&error];
        [mstr appendString:existCrashReport];
    }
    
    [mstr appendString:@"\n Stack Track:\n"];
    void* callstack[128];
    int i, frameCount = backtrace(callstack, 128);
    char** strs = backtrace_symbols(callstack, frameCount);
    for (i = 0; i < frameCount; i++) {
        [mstr appendFormat:@"%s\n", strs[i]];
    }
    [mstr writeToFile:crashReportPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    mstr = nil;
    
}


