//
//  BuyerEntity.h
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

//买家实体类

#import <Foundation/Foundation.h>

@interface BuyerEntity : NSObject

@property(nonatomic, copy)NSString *name;       //收件用户姓名
@property(nonatomic, copy)NSString *address;    //收件地址
@property(nonatomic, copy)NSString *phone;      //电话
@property(nonatomic, copy)NSString *email;      //邮箱

@end
