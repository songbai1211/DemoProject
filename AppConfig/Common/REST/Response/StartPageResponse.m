//
//  StartPageResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "StartPageResponse.h"

@implementation StartPageResponse

@synthesize startupPicList;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.startupPicList = [responseData valueForKey:@"startuppic"];
}

@end
