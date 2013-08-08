//
//  LoginResponse.h
//
//  Copyright 2012年 Twin-Fish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

#define REQUEST_PASSWORD_EXPIRED @"413"
#define REQUEST_FIRST_LOGIN @"441"
#define REQUEST_ACCOUNT_LOCKED @"442"


@interface LoginResponse : BaseResponse {
@private
    NSString *userID_;
    NSString *name_;
    NSString *password_;
    NSString *session_;
}

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *session;

@end
