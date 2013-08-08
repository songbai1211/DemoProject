//
//  MessageEntity.h
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//


//消息实体类

#import <Foundation/Foundation.h>


#define MESSAGE_STAR    0
#define MESSAGE_GOOD    1
#define MESSAGE_ORDER   2


@class StarMessage;
@class GoodMessage;
@class OrderMessage;

@interface MessageEntity : NSObject

@property(nonatomic, copy)NSString *messageId;            //消息ID
@property(nonatomic, assign)BOOL readFlag;                  //是否读取状态
@property(nonatomic, assign)long type;                      //消息类型

@property(nonatomic, retain)StarMessage     *starMessage;   //艺人新入驻通知
@property(nonatomic, retain)GoodMessage     *goodMessage;   //新商品上架通知
@property(nonatomic, retain)OrderMessage    *orderMessage;  //订单通知

@end


//艺人新入驻通知
@interface  StarMessage: NSObject

@property(nonatomic, copy)NSString * starId;            //艺人ID
@property(nonatomic, copy)NSString *name;           //艺人姓名
@property(nonatomic, copy)NSString *smallPicUrl;    //艺人小头像
@property(nonatomic, copy)NSString *content;        //消息内容

@end

//新商品上架通知
@interface  GoodMessage: NSObject

@property(nonatomic, copy)NSString *goodId;            //商品ID
@property(nonatomic, copy)NSString *goodName;       //商品名称
@property(nonatomic, copy)NSString *content;        //消息内容

@property(nonatomic, copy)NSString *starId;            //商品所属艺人ID
@property(nonatomic, copy)NSString *starName;       //所属艺人姓名
@property(nonatomic, copy)NSString *starPicUrl;     //所属艺人头像

@end


//订单通知
@interface  OrderMessage: NSObject


@end


