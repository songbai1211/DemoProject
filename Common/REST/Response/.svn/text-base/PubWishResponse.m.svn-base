//
//  PubWishResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "PubWishResponse.h"

@implementation PubWishResponse

@synthesize wishId;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.wishId = [responseData valueForKey:@"wishid"];
}

@end
