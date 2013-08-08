//
//  RegisterResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "RegisterResponse.h"

@implementation RegisterResponse

@synthesize userId;


- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.userId = [responseData valueForKey:@"userid"];
}

@end
