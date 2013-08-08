//
//  StarGoodsListRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "StarGoodsListRequest.h"
#import "StarGoodsListResponse.h"

@implementation StarGoodsListRequest

- (NSString *)url {
    return [NSString stringWithFormat:STARGOODSLIST, self.starId, self.page, self.userId];
}

- (Class)responseClass {
	return [StarGoodsListResponse class];
}

@end
