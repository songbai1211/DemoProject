//
//  GoodInfoEntity.h
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodDetailEntity.h"
#import "StarEntity.h"

@interface GoodInfoEntity : NSObject

@property(nonatomic, retain)StarEntity          *starUserInfo;      //所属的明星用户信息
@property(nonatomic, retain)GoodDetailEntity    *goodDetailInfo;    //商品详细信息

@end



