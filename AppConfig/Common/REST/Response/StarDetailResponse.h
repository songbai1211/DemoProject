//
//  StarDetailResponse.h
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BaseRestResponse.h"
#import "StarEntity.h"

@interface StarDetailResponse : BaseRestResponse

@property(nonatomic, retain)StarEntity *starDetailInfo;       //艺人详情

@end
