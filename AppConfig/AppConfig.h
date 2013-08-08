//
//  AppConfig.h
//
//  Created by zzc on 12-3-23.
//  Copyright 2012年 Twin-Fish. All rights reserved.
//



#define kAPPID                  @"123456789"
#define kAPPName                [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kAPPCommentUrl          @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d"
#define kAPPUpdateUrl           @"http://itunes.apple.com/lookup?id=%d"







//----------Frame大小-------
#define GobalNavFrame                     CGRectMake(0, 0, 320, 55)
#define GobalNavLeftButtonFrame           CGRectMake(8, 0, 32, 49)
#define GobalNavSegLineFrame              CGRectMake(48, 0, 2, 49)
#define GobalNavTitleFrame                CGRectMake(80, 0, 160, 49)
#define GobalNavRightButtonFrame          CGRectMake(280, 0, 32, 49)

#define AppVersion_VersionLabelFrame        CGRectMake(0, 396, 320, 18)
#define AppVersion_CopyrightLabelFrame		CGRectMake(0, 414, 320, 18)
#define AppVersion_AllRightLabelFrame		CGRectMake(0, 432, 320, 18)

//----------字体大小----------
#define GobalNavTitleFont       [UIFont systemFontOfSize:20]
#define GobalCommonFont         [UIFont systemFontOfSize:15]

//----------图标边距----------
#define GobalLeftSideButtonIconEdgeInset   UIEdgeInsetsMake(13, 3, 14, 4)
#define GobalBackButtonIconEdgeInset       UIEdgeInsetsMake(14, 9, 15, 10)
#define GobalNavRightButtonIconEdgeInset   UIEdgeInsetsMake(13, 3, 14, 4) 


//----------屏幕尺寸----------
#define kScreenWidth          ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight         ([UIScreen mainScreen].bounds.size.height)



//语言
#define kDefaultLanguageKey             @"kDefaultLanguage"
#define kLanguage_English               @"English"
#define kLanguage_SimpleChinese         @"简体中文"

/*用户登陆历史*/
#define kLoginHistoryKey                @"loginHistory"
#define kLoginInfo_userName             @"userName"
#define kLoginInfo_nickName             @"nickName"
#define kLoginInfo_password             @"password"
#define kLoginInfo_isRemember           @"isRemember"
#define kLoginInfo_isAutoLogin          @"isAutoLogin"


#define MAX_LOGIN_USERNAME_LENGTH           16
#define MAX_LOGIN_PASSWORD_LENGTH           16
#define MAX_LOGIN_EMAIL_LENGTH              64

#define HeartBeatWithSeconds                300























