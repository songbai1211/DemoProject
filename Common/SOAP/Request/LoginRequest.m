//
//  LoginRequest.m
//
//  Copyright 2012年 Twin-Fish. All rights reserved.
//

#import "LoginRequest.h"
#import "LoginResponse.h"
#import "LoginParam.h"

@implementation LoginRequest

- (Class)responseClass {
	return [LoginResponse class];
}

- (NSString *)requestName {
	return LOGIN_SOAP_ACTION_NAME;
}

@end
