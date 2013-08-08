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
@synthesize midPicUrl;
@synthesize identity;
@synthesize unReadMsg;
@synthesize unDealOrder;


- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.userId         = [responseData valueForKey:@"userid"];
    self.session        = [responseData valueForKey:@"session"];
    self.midPicUrl      = [responseData valueForKey:@"midpic"];
    self.identity       = [[responseData valueForKey:@"identity"] longValue];
    self.unReadMsg      = [[responseData valueForKey:@"unreadmsg"] longValue];
    self.unDealOrder    = [[responseData valueForKey:@"undealorder"] longValue];
}

@end
