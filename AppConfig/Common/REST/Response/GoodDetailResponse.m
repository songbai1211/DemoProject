//
//  GoodDetailResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "GoodDetailResponse.h"

@implementation GoodDetailResponse

@synthesize goodDetailInfo;
@synthesize starUserInfo;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    NSDictionary *tempGoodDetailInfo = [responseData valueForKey:@"goodsinfo"];
    NSDictionary *tempStarUserInfo = [responseData valueForKey:@"starinfo"];
    
    if ((tempGoodDetailInfo != nil) && [tempGoodDetailInfo count] != 0) {
        
        self.goodDetailInfo = [[GoodDetailEntity alloc] init];
        
        self.goodDetailInfo.goodId          = [tempGoodDetailInfo valueForKey:@"id"];
        self.goodDetailInfo.goodName        = [tempGoodDetailInfo valueForKey:@"name"];
        self.goodDetailInfo.price           = [[tempGoodDetailInfo valueForKey:@"price"] longValue];
        self.goodDetailInfo.goodBrief       = [tempGoodDetailInfo valueForKey:@"goodsbrief"];
        self.goodDetailInfo.goodDetaildesc  = [tempGoodDetailInfo valueForKey:@"goodsdetail"];

        NSDictionary *numberLimit           = [tempGoodDetailInfo valueForKey:@"numberlimit"];
        self.goodDetailInfo.goodLimitType   = [[numberLimit valueForKey:@"type"] longValue];
        self.goodDetailInfo.goodTotal       = [[numberLimit valueForKey:@"total"] longValue];
        self.goodDetailInfo.goodLeft        = [[numberLimit valueForKey:@"left"] longValue];
        
        NSDictionary *timeLimit             = [tempGoodDetailInfo valueForKey:@"timelimit"];
        self.goodDetailInfo.expireTime      = [[timeLimit valueForKey:@"expiretime"] longValue];
        self.goodDetailInfo.leftTime        = [[timeLimit valueForKey:@"lefttime"] longValue];
        
        self.goodDetailInfo.displayType     = [[tempGoodDetailInfo valueForKey:@"displaytype"] longValue];
        self.goodDetailInfo.picUrl          = [tempGoodDetailInfo valueForKey:@"pic"];
        self.goodDetailInfo.videoUrl        = [tempGoodDetailInfo valueForKey:@"videourl"];

    }
    
    if ((tempStarUserInfo != nil) && [tempStarUserInfo count] != 0) {
        
        self.starUserInfo = [[StarEntity alloc] init];
        
        self.starUserInfo.userId    = [tempStarUserInfo valueForKey:@"id"];
        self.starUserInfo.name      = [tempStarUserInfo valueForKey:@"name"];
        self.starUserInfo.bigPicUrl = [tempStarUserInfo valueForKey:@"bigpic"];
    }

}

@end
