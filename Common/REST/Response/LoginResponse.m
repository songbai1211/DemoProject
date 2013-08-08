//
//  LoginResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "LoginResponse.h"

@implementation LoginResponse

@synthesize userId;
@synthesize session;



- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.userId         = [responseData valueForKey:@"userid"];
    self.session        = [responseData valueForKey:@"session"];

}

@end
