//
//  baseAppDelegate.m
//  MMeeting
//
//  Created by apple on 13-3-12.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "BaseAppDelegate.h"

@implementation BaseAppDelegate

@synthesize appLanchType;

#pragma mark - Crash report

- (BOOL)hasCrashed
{
    NSString *crashFlag = [[NSUserDefaults standardUserDefaults] valueForKey:kDefaultCrashFlag];
    return ([crashFlag isEqualToString:@"YES"]);
}

- (void)setCrashFlag
{
    [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:kDefaultCrashFlag];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)clearCrashFlag
{
    [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:kDefaultCrashFlag];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)processException:(NSException *)exception
{
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    NSDate *curDate = [NSDate date];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *exceptionInfo = [NSString stringWithFormat:@"current time: %@\n exception name: %@\n exception reason: %@\n exception userinfo: %@\n Stack Trace: %@",
                               [formatter stringFromDate:curDate], [exception name], [exception reason], [exception userInfo], [exception callStackSymbols]];

    /*创建crash文件目录*/
    NSString *crashLogDirPath = [[MMSandbox docPath] stringByAppendingPathComponent:@"log/mmeeting"];
    crashLogDirPath           = [MMSandbox touch:crashLogDirPath];
    
    /*打开crash文件*/
    NSString *crashFileName = [NSString stringWithFormat:@"%@/crashreport.txt", crashLogDirPath];
    FILE *fd = fopen([crashFileName UTF8String], "w+");
    if (fd == NULL) {
        MMLogInfo(@"open log file failed.");
        return;
    }
    
    /*写crash信息到文件中*/
    
    fputs([[exception name] UTF8String], fd);
    
//    NSString *callStackInfo = [NSString stringWithFormat:@"%@", [exception callStackSymbols]];
    fputs([exceptionInfo UTF8String], fd);
    fputs("\r\n", fd);
    fflush(fd);
    fclose(fd);
    
    [self setCrashFlag];
}

-(void)SignalHandler
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


- (void)initMMeeting
{
    [self readConfig];
    
    NSString *langCode = @"";
    
    if ([[NSUserDefaults standardUserDefaults] stringForKey:kDefaultIsFirstLaunch] == nil) {
        NSArray *languages = [NSLocale preferredLanguages];
        langCode = [languages objectAtIndex:0];
        if (([langCode isEqualToString:@"zh-Hans"] == NO) && ([langCode isEqualToString:@"es"] == NO))
            langCode = @"en";
        if ([langCode isEqualToString:@"en"] == YES) {
            [[NSUserDefaults standardUserDefaults] setObject:kLanguage_English forKey:kDefaultLanguage];
        }
        else if ([langCode isEqualToString:@"zh-Hans"] == YES) {
            [[NSUserDefaults standardUserDefaults] setObject:kLanguage_SimpleChinese forKey:kDefaultLanguage];
        }
        else
        {
           [[NSUserDefaults standardUserDefaults] setObject:kLanguage_English forKey:kDefaultLanguage]; 
        }
    } 
    
    /*初始化*/ 
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:DEFAULT_LAUNCH_FLAG forKey:kDefaultIsFirstLaunch];
    [userDefaults setValue:DEFAULT_NICK_NAME forKey:kDefaultNickNameKey];
    [userDefaults setValue:DEFAULT_MEDIA_IP forKey:kDefaultMediaxHostKey];
    [userDefaults setValue:DEFAULT_MEDIA_PORT forKey:kDefaultMediaxPortKey];
    [userDefaults setValue:DEFAULT_MEDIA_SERVER_VERSION forKey:kDefaultMediaServerVersionKey];
    
    //首次打开APP，默认使用http连接
    [userDefaults setValue:@"NO" forKey:kDefaultMediaxUseHttpsKey];
    
    
    [userDefaults setValue:DEFAULT_IMS_IP forKey:kDefaultImsIpKey];
    [userDefaults setValue:DEFAULT_IMS_PORT forKey:kDefaultImsPortKey];
    [userDefaults setValue:DEFAULT_IMS_HOST forKey:kDefaultImsHostKey];
    [userDefaults setValue:DEFAULT_IMS_ACCOUNT forKey:kDefaultImsAccountKey];
    [userDefaults setValue:DEFAULT_IMS_PASSWORD forKey:kDefaultImsPasswordKey];
    [userDefaults setValue:DEFAULT_IMS_ACCOUNT_PRIVATE_ID forKey:kDefaultImsAccountIdKey];
    [userDefaults setValue:DEFAULT_IMS_ACCOUNT_PUBLIC_ID forKey:kDefaultImsAccountPublicIdKey];
    [userDefaults setValue:DEFAULT_OPEN_DATE_MEETING forKey:kDefaultOpenDataMeetingKey];
    [userDefaults setValue:DEFAULT_MEETING_CONNECT_TYPE forKey:kDefaultMeetingConnectType];
    [userDefaults setValue:DEFAULT_SVN_MODE_PARAM forKey:kDefaultsvnModeKey];
    
    //[userDefaults setValue:DEFAULT_LANGUAGE_NAME forKey:kDefaultLanguage];
    NSLog(@"NSLocale %@\n\n\n",[[NSLocale preferredLanguages] objectAtIndex:0]);
    
    
    [userDefaults setValue:DEFAULT_MEETINGTYPE forKey:kDefaultMeetingTypeKey];  //默认音频
    [userDefaults setValue:DEFAULT_AUTOVIDEO forKey:kDefaultAutoVideoKey];      //默认打开视频
    
    [userDefaults setValue:DEFAULT_SKIN forKey:kDefaultSkin];//默认皮肤
    [userDefaults synchronize];
    
    
    

}

#pragma mark - Log

- (void)readConfig
{
    // set default parameters
    [[NSUserDefaults standardUserDefaults] setValue:MMLOG_LEVEL_STRING_INFO forKey:kDefaultLogLevel];
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%u", DEFAULT_LOG_COUNT]
                                             forKey:kDefaultLogCountLimit];
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%u", (DEFAULT_LOG_SIZE >> 10)]
                                             forKey:kDefaultLogSizeLimit];
    
    // read config file content
    NSString *configFilePath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"xml"];
    NSString *config = [NSString stringWithContentsOfFile:configFilePath encoding:NSUTF8StringEncoding error:nil];
    if ([config length] == 0) {
        NSLog(@"no configration file");
        return;
    }
    
    // parse xml content of config file
    CXMLDocument *theXmlDocument = [[CXMLDocument alloc] initWithXMLString:config options:0 error:nil];
    NSArray *children = [[theXmlDocument rootElement] children];
    
    for (CXMLElement *child in children) {
        if ([[child name] isEqualToString:@"string"]) {
            
            NSString *name = [[child attributeForName:@"name"] stringValue];
            NSString *value = [child stringValue];
            
            if ([name isEqualToString:@"log_file_level"]) {
                
                [[NSUserDefaults standardUserDefaults] setValue:value forKey:kDefaultLogLevel];
                
            } else if ([name isEqualToString:@"log_file_count"]) {
                
                [[NSUserDefaults standardUserDefaults] setValue:value forKey:kDefaultLogCountLimit];
                
            } else if ([name isEqualToString:@"log_file_size"]) {
                
                [[NSUserDefaults standardUserDefaults] setValue:value forKey:kDefaultLogSizeLimit];
                
            } else if ([name isEqualToString:@"log_file_size_max"]) {       // not used
                
            } else if ([name isEqualToString:@"log_mail_from_addr"]) {
                
                [[NSUserDefaults standardUserDefaults] setValue:value forKey:kDefaultMailFromAddress];
                
            } else if ([name isEqualToString:@"log_mail_from_pwd"]) {
                
                [[NSUserDefaults standardUserDefaults] setValue:value forKey:kDefaultMailFromPassword];
                
            } else if ([name isEqualToString:@"log_mail_from_host"]) {
                
                [[NSUserDefaults standardUserDefaults] setValue:value forKey:kDefaultMailRelayHost];
                
            } else if ([name isEqualToString:@"log_mail_from_protocol"]) {      // not used
                
            } else if ([name isEqualToString:@"log_mail_to_addr"]) {
                
                [[NSUserDefaults standardUserDefaults] setValue:value forKey:kDefaultMailToAddress];
                
            } else if ([name isEqualToString:@"contact_phone"]) {       // not used
                
            } else if ([name isEqualToString:@"web_url"]) {         // not used
                
            }
        }
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[MMLog sharedInstance] updateParams];
}





@end

void uncaughtExceptionHandler(NSException *exception)
{
    BaseAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate processException:exception];
}

void stacktrace(int sig, siginfo_t *info, void *context)
{
    NSError *error ;
    NSFileManager *fileManager =[NSFileManager defaultManager];
    NSMutableString *mstr = [[NSMutableString alloc] initWithCapacity:128];
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *crashReportPath = [documentsDirectory stringByAppendingString:@"/log/mmeeting/crashreport.txt"];
    
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
    
    [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:kDefaultCrashFlag];
    [[NSUserDefaults standardUserDefaults] synchronize];

}



 