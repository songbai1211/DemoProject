//
//  FansEntity.h
//  DemoProject
//
//  Created by apple on 13-7-25.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FansEntity : NSObject

@property(nonatomic, copy)NSString *userId;         //用户id
@property(nonatomic, copy)NSString *name;           //用户名
@property(nonatomic, copy)NSString *midPicUrl;      //用户中头像地址
@property(nonatomic, assign)long   identity;        //用户身份


@end
