//
//  LoginResponse.h
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BaseRestResponse.h"

@interface LoginResponse : BaseRestResponse

@property(nonatomic, copy)NSString *userId;     //用户ID
@property(nonatomic, copy)NSString *session;    //session


@end
