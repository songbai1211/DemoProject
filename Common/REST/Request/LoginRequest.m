//
//  LoginRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "LoginRequest.h"
#import "LoginResponse.h"

@implementation LoginRequest


- (NSString *)url {
    return LOGIN;
}

- (Class)responseClass {
	return [LoginResponse class];
}

@end
