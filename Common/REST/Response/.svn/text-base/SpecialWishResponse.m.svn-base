//
//  SpecialWishResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "SpecialWishResponse.h"

@implementation SpecialWishResponse

@synthesize curPage;
@synthesize totalPage;
@synthesize totalNum;
@synthesize goodsList;



- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.curPage    = [[responseData valueForKey:@"curpage"] longValue];
    self.totalPage  = [[responseData valueForKey:@"totalpage"] longValue];
    self.totalNum   = [[responseData valueForKey:@"totalnum"] longValue];
    
    NSArray *tempGoodsList = [responseData valueForKey:@"goodslist"];
    if ((tempGoodsList == nil) || [tempGoodsList count] == 0) {
        return;
    }
    
    self.goodsList = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *good in tempGoodsList) {
        NSDictionary *tempStarUserInfo      = [good valueForKey:@"userinfo"];
        NSDictionary *tempGoodDetailInfo    = [good valueForKey:@"goodsinfo"];
        
        GoodInfoEntity *goodEntity = [[GoodInfoEntity alloc] init];
        
        if ((tempStarUserInfo != nil) && [tempStarUserInfo count] != 0) {
            
            goodEntity.starUserInfo             = [[StarEntity alloc] init];
            
            goodEntity.starUserInfo.userId      = [tempStarUserInfo valueForKey:@"id"];
            goodEntity.starUserInfo.name        = [tempStarUserInfo valueForKey:@"name"];
            goodEntity.starUserInfo.fansNum     = [[tempStarUserInfo valueForKey:@"fansnum"] longValue];
            goodEntity.starUserInfo.isInterest  = [[tempStarUserInfo valueForKey:@"isinterest"] boolValue];
            goodEntity.starUserInfo.midPicUrl   = [tempStarUserInfo valueForKey:@"midpic"];
        }
        
        if ((tempGoodDetailInfo != nil) && [tempGoodDetailInfo count] != 0) {
            
            goodEntity.goodDetailInfo               = [[GoodDetailEntity alloc] init];
            
            goodEntity.goodDetailInfo.goodId        = [tempGoodDetailInfo valueForKey:@"id"];
            goodEntity.goodDetailInfo.goodName      = [tempGoodDetailInfo valueForKey:@"name"];
            goodEntity.goodDetailInfo.price         = [[tempGoodDetailInfo valueForKey:@"price"] longValue];
            
            NSDictionary *numberLimit               = [tempGoodDetailInfo valueForKey:@"numberlimit"];
            goodEntity.goodDetailInfo.goodLimitType = [[numberLimit valueForKey:@"type"] longValue];
            goodEntity.goodDetailInfo.goodTotal     = [[numberLimit valueForKey:@"total"] longValue];
            goodEntity.goodDetailInfo.goodLeft      = [[numberLimit valueForKey:@"left"] longValue];
            
            goodEntity.goodDetailInfo.picUrl        = [tempGoodDetailInfo valueForKey:@"pic"];
            
            NSDictionary *timeLimit                 = [tempGoodDetailInfo valueForKey:@"timelimit"];
            goodEntity.goodDetailInfo.expireTime    = [[timeLimit valueForKey:@"expiretime"] longValue];
            goodEntity.goodDetailInfo.leftTime      = [[timeLimit valueForKey:@"lefttime"] longValue];
        }
        
        [self.goodsList addObject:goodEntity];
    }
}

@end
