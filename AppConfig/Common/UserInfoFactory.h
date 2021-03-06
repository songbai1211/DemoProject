//
//  UserInfoFactory.h
//
//  Created by apple on 13-3-15.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kAllLoginHistory            @"AllLoginHistory"
#define kAES256LoginHistoryKey      @"opqrstuvwxyzabcdefghijklmn"

@interface UserInfo : NSObject

@property(nonatomic, retain)NSString *userName;     //用户名
@property(nonatomic, retain)NSString *nickName;     //昵称
@property(nonatomic, retain)NSString *password;     //密码
@property(nonatomic, assign)BOOL isRemember;        //是否记住密码
@property(nonatomic, assign)BOOL isAutoLogin;       //是否自动登陆
@property(nonatomic, assign)BOOL isStar;            //是否艺人
@property(nonatomic, assign)BOOL isLogined;         //是否已经登陆

@end


@interface XinYuanUser : NSObject

@property(nonatomic, copy)NSString *userId;        //用户ID
@property(nonatomic, copy)NSString *nickName;   //昵称
@property(nonatomic, copy)NSString *password;   //密码
@property(nonatomic, copy)NSString *session;    //session
@property(nonatomic, copy)NSString *midPicUrl;  //用户中头像
@property(nonatomic, assign)long identity;      //用户身份(0,普通用户，1 艺人用户)
@property(nonatomic, assign)BOOL isLogined;     //是否已登陆

@end



@interface UserInfoFactory : NSObject

//加载登陆历史
+ (NSMutableArray *)loadLoginHistory;

//保存登陆历史
+ (void)saveLoginHistoryWithAllUserInfo:(NSMutableArray *)curUserInfoArr;

//更新登陆历史
+ (void)updateLoginHistoryWithUserInfo:(UserInfo *)curUserInfo;

//根据用户名查询该用户的昵称
+ (NSString *)searchNickNameByUserName:(NSString *)userName;

//加密
+ (NSData *)useAES256Encrypt:(NSString *)plainText;

//解密
+ (NSString *)useAES256Decrypt:(NSData *)cipherData;

@end
