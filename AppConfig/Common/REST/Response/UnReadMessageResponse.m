//
//  UnReadMessageResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "UnReadMessageResponse.h"

@implementation UnReadMessageResponse

@synthesize unReadNum;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.unReadNum         = [[responseData valueForKey:@"unreadnum"] longValue];

}

@end
