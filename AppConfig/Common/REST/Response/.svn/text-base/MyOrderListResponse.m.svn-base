//
//  MyOrderListResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "MyOrderListResponse.h"
#import "OrderEntity.h"

@implementation MyOrderListResponse

@synthesize curPage;
@synthesize totalPage;
@synthesize totalNum;
@synthesize orderList;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.curPage    = [[responseData valueForKey:@"curpage"] longValue];
    self.totalPage  = [[responseData valueForKey:@"totalpage"] longValue];
    self.totalNum   = [[responseData valueForKey:@"totalnum"] longValue];
    
    NSArray *tempOrderList = [responseData valueForKey:@"orderlist"];
    if ((tempOrderList == nil) || [tempOrderList count] == 0) {
        return;
    }
    
    self.orderList = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *order in tempOrderList) {
        
        OrderEntity *orderEntity = [[OrderEntity alloc] init];
        
        NSDictionary *userInfoDic   = [order valueForKey:@"userinfo"];
        FansEntity *buyerInfo       = [[FansEntity alloc] init];
        buyerInfo.userId            = [userInfoDic valueForKey:@"id"];
        buyerInfo.name              = [userInfoDic valueForKey:@"name"];
        buyerInfo.midPicUrl         = [userInfoDic valueForKey:@"midpic"];
        buyerInfo.identity          = [[userInfoDic valueForKey:@"identity"] longValue];
        orderEntity.buyerInfo       = buyerInfo;
        
        NSDictionary *goodInfoDic   = [order valueForKey:@"goodsinfo"];
        GoodDetailEntity *goodInfo  = [[GoodDetailEntity alloc] init];
        goodInfo.goodId             = [goodInfoDic valueForKey:@"id"];
        goodInfo.goodName           = [goodInfoDic valueForKey:@"name"];
        goodInfo.price              = [[goodInfoDic valueForKey:@"price"] longValue];
        goodInfo.picUrl             = [goodInfoDic valueForKey:@"pic"];
        orderEntity.goodDetailInfo  = goodInfo;
        
        NSDictionary *orderInfoDic          = [order valueForKey:@"orderinfo"];
        OrderDetailInfo *orderDetailInfo    = [[OrderDetailInfo alloc] init];
        orderDetailInfo.orderId             = [orderInfoDic valueForKey:@"id"];
        orderDetailInfo.time                = [[orderInfoDic valueForKey:@"time"] longValue];
        orderDetailInfo.status              = [[orderInfoDic valueForKey:@"status"] longValue];
        orderEntity.orderDetailInfo         = orderDetailInfo;
        
        [self.orderList addObject:orderEntity];
    }
}

@end
