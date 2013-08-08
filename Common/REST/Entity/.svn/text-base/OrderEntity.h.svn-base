//
//  OrderEntity.h
//  DemoProject
//
//  Created by apple on 13-7-25.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FansEntity.h"
#import "GoodDetailEntity.h"

@class OrderDetailInfo;

@interface OrderEntity : NSObject

@property(nonatomic, retain)FansEntity          *buyerInfo;             //买家信息
@property(nonatomic, retain)GoodDetailEntity    *goodDetailInfo;        //订单商品详细信息
@property(nonatomic, retain)OrderDetailInfo     *orderDetailInfo;       //订单信息

@end


@interface OrderDetailInfo : NSObject

@property(nonatomic, copy)NSString *orderId;        //订单ID
@property(nonatomic, assign)long time;              //订单最后更新时间
@property(nonatomic, assign)long status;            //当前状态

@end