//
//  StarGoodsListResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "StarGoodsListResponse.h"

@implementation StarGoodsListResponse

@synthesize curPage;
@synthesize totalPage;
@synthesize totalNum;
@synthesize goodDetailList;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.curPage    = [[responseData valueForKey:@"curpage"] longValue];
    self.totalPage  = [[responseData valueForKey:@"totalpage"] longValue];
    self.totalNum   = [[responseData valueForKey:@"totalnum"] longValue];
    
    NSArray *tempGoodDetailList = [responseData valueForKey:@"goodslist"];
    if ((tempGoodDetailList == nil) || [tempGoodDetailList count] == 0) {
        return;
    }
    
    self.goodDetailList = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *goodDetail in tempGoodDetailList) {

        GoodDetailEntity *goodDetailEntity = [[GoodDetailEntity alloc] init];
        
        if ((goodDetail != nil) && [goodDetail count] != 0) {
            goodDetailEntity.goodId         = [goodDetail valueForKey:@"id"];
            goodDetailEntity.goodName       = [goodDetail valueForKey:@"name"];
            goodDetailEntity.price          = [[goodDetail valueForKey:@"price"] longValue];
            
            NSDictionary *numberLimit      = [goodDetail valueForKey:@"numberlimit"];
            goodDetailEntity.goodTotal     = [[numberLimit valueForKey:@"total"] longValue];
            goodDetailEntity.goodLeft      = [[numberLimit valueForKey:@"left"] longValue];

            goodDetailEntity.picUrl         = [goodDetail valueForKey:@"pic"];
            
            NSDictionary *timeLimit         = [goodDetail valueForKey:@"timelimit"];
            goodDetailEntity.expireTime     = [[timeLimit valueForKey:@"expiretime"] longValue];
            goodDetailEntity.leftTime       = [[timeLimit valueForKey:@"lefttime"] longValue];
        }
        [self.goodDetailList addObject:goodDetailEntity];
    }
}

@end
