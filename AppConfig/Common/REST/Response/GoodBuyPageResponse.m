//
//  GoodBuyPageResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "GoodBuyPageResponse.h"

@implementation GoodBuyPageResponse

@synthesize goodDetailInfo;
@synthesize buyerInfo;


- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }

    NSDictionary *tempGoodDetailInfo = [responseData valueForKey:@"goodsinfo"];
    NSDictionary *tempBuyerInfo = [responseData valueForKey:@"recipientinfo"];
    
    if ((tempGoodDetailInfo != nil) && [tempGoodDetailInfo count] != 0) {
        
        self.goodDetailInfo = [[GoodDetailEntity alloc] init];
        self.goodDetailInfo.goodId      = [tempGoodDetailInfo valueForKey:@"id"];
        self.goodDetailInfo.goodName    = [tempGoodDetailInfo valueForKey:@"name"];
        self.goodDetailInfo.price       = [[tempGoodDetailInfo valueForKey:@"price"] longValue];

        NSDictionary *numberLimit           = [tempGoodDetailInfo valueForKey:@"numberlimit"];
        self.goodDetailInfo.goodLimitType   = [[numberLimit valueForKey:@"type"]longValue];
        self.goodDetailInfo.goodTotal       = [[numberLimit valueForKey:@"total"] longValue];
        self.goodDetailInfo.goodLeft        = [[numberLimit valueForKey:@"left"] longValue];
        
        self.goodDetailInfo.picUrl      = [tempGoodDetailInfo valueForKey:@"pic"];
        
        NSDictionary *timeLimit         = [tempGoodDetailInfo valueForKey:@"timelimit"];
        self.goodDetailInfo.expireTime  = [[timeLimit valueForKey:@"expiretime"] longValue];
        self.goodDetailInfo.leftTime    = [[timeLimit valueForKey:@"lefttime"] longValue];
    }
    
    if ((tempBuyerInfo != nil) && [tempBuyerInfo count] == 0) {
        
        self.buyerInfo          = [[BuyerEntity alloc] init];
        
        self.buyerInfo.name     = [tempBuyerInfo valueForKey:@"name"];
        self.buyerInfo.address  = [tempBuyerInfo valueForKey:@"address"];
        self.buyerInfo.phone    = [tempBuyerInfo valueForKey:@"phone"];
        self.buyerInfo.email    = [tempBuyerInfo valueForKey:@"email"];
    }
}

@end
