//
//  StarDetailResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "StarDetailResponse.h"

@implementation StarDetailResponse

@synthesize starDetailInfo;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.starDetailInfo = [[StarEntity alloc] init];
    
    self.starDetailInfo.userId              = [responseData valueForKey:@"id"];
    self.starDetailInfo.name                = [responseData valueForKey:@"name"];
    self.starDetailInfo.fansNum             = [[responseData valueForKey:@"fansnum"] longValue];
    self.starDetailInfo.goodsNum            = [[responseData valueForKey:@"goodsnum"] longValue];
    self.starDetailInfo.isInterest          = [[responseData valueForKey:@"isinterent"] boolValue];
    self.starDetailInfo.backgroundPicUrl    = [responseData valueForKey:@"backgoundpic"];
    
}


@end
