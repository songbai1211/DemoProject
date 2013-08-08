//
//  StarEntity.h
//  DemoProject
//
//  Created by apple on 13-7-25.
//  Copyright (c) 2013年 apple. All rights reserved.
//

//艺人实体类

#import <Foundation/Foundation.h>

@interface StarEntity : NSObject

@property(nonatomic, assign)long fansNum;               //粉丝数
@property(nonatomic, assign)long goodsNum;              //有效商品个数
@property(nonatomic, assign)BOOL isInterest;            //是否已被自己关注

@property(nonatomic, copy)NSString *userId;                //明星用户ID
@property(nonatomic, copy)NSString *name;               //用户名
@property(nonatomic, copy)NSString *midPicUrl;          //用户中头像地址
@property(nonatomic, copy)NSString *bigPicUrl;          //用户大头像
@property(nonatomic, copy)NSString *backgroundPicUrl;   //用户背景头像地址

@end
