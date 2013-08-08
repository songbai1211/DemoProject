//
//  UserLoginInfoFactory.m
//
//  Created by apple on 13-3-15.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "UserInfoFactory.h"
#import "AppCore.h"


@implementation UserInfo

@synthesize userName    = _userName;
@synthesize nickName    = _nickName;
@synthesize password    = _password;
@synthesize isRemember  = _isRemember;
@synthesize isAutoLogin = _isAutoLogin;
@synthesize isLogined   = _isLogined;



- (id)init
{
    self = [super init];
    if (self) {
        _userName   = nil;
        _nickName   = nil;
        _password   = nil;
        _isRemember     = NO;
        _isAutoLogin    = NO;
        _isLogined      = NO;

    }
    return self;
}

@end


@interface UserInfoFactory (Private)

//把userInfo对象存储到Dictionary中
+ (NSMutableDictionary *)convertFromUserInfo:(UserInfo *)currentUserInfo;

//把Dictionary中保存的用户信息，保存到userInfo对象中
+ (UserInfo *)userInfoConvertFromDic:(NSMutableDictionary *)userInfoDic;

@end


@implementation UserInfoFactory

//加载登陆历史
+ (NSMutableArray *)loadLoginHistory
{
    MMLogDebug(@"loading login history...");
    NSArray *tempLoginHistoryArr = [[NSUserDefaults standardUserDefaults] arrayForKey:kAllLoginHistory];
    NSMutableArray *allLoginHistoryArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSMutableDictionary *dic in tempLoginHistoryArr) {
        [allLoginHistoryArr addObject:[self userInfoConvertFromDic:dic]];
    }
    return allLoginHistoryArr;
}

//保存登陆历史
+ (void)saveLoginHistoryWithAllUserInfo:(NSMutableArray *)curUserInfoArr
{
    MMLogDebug(@"saving login history...");
    NSMutableArray *allUserInfoArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (UserInfo *user in curUserInfoArr) {
        [allUserInfoArr addObject:[self convertFromUserInfo:user]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:[allUserInfoArr head:5] forKey:kAllLoginHistory];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


//更新登陆历史
+ (void)updateLoginHistoryWithUserInfo:(UserInfo *)curUserInfo
{
    MMLogDebug(@"updating login history...");
    if (curUserInfo == nil) {
        return;
    }
    
    //加载当前所有登陆历史记录
    NSMutableArray *loginHistoryArr = [self loadLoginHistory];
    
    /*遍历登陆历史记录数组，判断当前登陆用户是否已经存在*/
    NSUInteger index;
    for (index = 0; index < [loginHistoryArr count]; ++index) {
        UserInfo *tempUserinfo = [loginHistoryArr objectAtIndex:index];
        if ([curUserInfo.userName isEqualToString:tempUserinfo.userName]) {
            break;
        }
    }
    
    /*如果登陆历史数组不为空，则索引index的值 不等于数组大小，表示历史数组中找到当前登陆用户*/
    if (([loginHistoryArr count] > 0) && ( index < [loginHistoryArr count])) {
        [loginHistoryArr removeObjectAtIndex:index];
    }
    
    [loginHistoryArr pushHead:curUserInfo];
    [self saveLoginHistoryWithAllUserInfo:loginHistoryArr];
    
}

#pragma mark -Private
//把userLoginInfo对象存储到Dictionary中
+ (NSMutableDictionary *)convertFromUserInfo:(UserInfo *)currentUserInfo
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dic setObject:currentUserInfo.userName forKey:kLoginInfo_userName];
    [dic setObject:currentUserInfo.nickName forKey:kLoginInfo_nickName];
    [dic setObject:[self useAES256Encrypt:currentUserInfo.password] forKey:kLoginInfo_password];
    [dic setObject:(currentUserInfo.isRemember ? @"YES" : @"NO") forKey:kLoginInfo_isRemember];
    [dic setObject:(currentUserInfo.isAutoLogin ? @"YES" : @"NO") forKey:kLoginInfo_isAutoLogin];

    return dic;
}

//把Dictionary中保存的用户信息，保存到userLoginInfo对象中
+ (UserInfo *)userInfoConvertFromDic:(NSMutableDictionary *)userInfoDic
{
    UserInfo *tempUserInfo      = [[UserInfo alloc] init];
    tempUserInfo.userName       = [userInfoDic objectForKey:kLoginInfo_userName];
    tempUserInfo.nickName       = [userInfoDic objectForKey:kLoginInfo_nickName];
    tempUserInfo.password       = [self useAES256Decrypt:[userInfoDic objectForKey:kLoginInfo_password]];
    tempUserInfo.isRemember     = [[userInfoDic objectForKey:kLoginInfo_isRemember] boolValue];
    tempUserInfo.isAutoLogin    = [[userInfoDic objectForKey:kLoginInfo_isAutoLogin] boolValue];
    
    return tempUserInfo;
}


//根据用户名查询该用户的昵称
+ (NSString *)searchNickNameByUserName:(NSString *)userName
{
    NSMutableArray *loginHistory = [self loadLoginHistory];
    for (int i = 0; i < [loginHistory count]; ++i) {
        
        UserInfo *temp = [loginHistory objectAtIndex:i];
        if ([userName isEqualToString:temp.userName]) {
            
            //已找到，返回该用户昵称
            return temp.nickName;
        }
    }
    
    //没找到，直接返回Nil
    return nil;
}

#pragma mark --加密解密

//加密
+ (NSData *)useAES256Encrypt:(NSString *)plainText
{
    NSData *res = nil;
    if (plainText) {
        NSData *plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
        res = [plainData AES256EncryptWithKey:kAES256LoginHistoryKey];
    }
    return res;
}

//解密
+ (NSString *)useAES256Decrypt:(NSData *)cipherData
{
    NSString *res = nil;
    if ((cipherData != nil) && ([cipherData length] > 0)) {
        NSData *plainData = [cipherData AES256DecryptWithKey:kAES256LoginHistoryKey];
        res = [[NSString alloc] initWithData:plainData encoding:NSUTF8StringEncoding];
    }
    return res;
}

@end
