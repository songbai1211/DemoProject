//
//  StarGoodsListResponse.h
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BaseRestResponse.h"
#import "GoodInfoEntity.h"

@interface StarGoodsListResponse : BaseRestResponse

@property(nonatomic, assign)long curPage;                   //请求的当前页数
@property(nonatomic, assign)long totalPage;                 //总页数
@property(nonatomic, assign)long totalNum;                  //商品总数
@property(nonatomic, retain)NSMutableArray *goodDetailList; //商品详情列表

@end
