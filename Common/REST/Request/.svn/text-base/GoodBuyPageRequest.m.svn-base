//
//  GoodBuyPageRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "GoodBuyPageRequest.h"
#import "GoodBuyPageResponse.h"

@implementation GoodBuyPageRequest

- (NSString *)url {
    return [NSString stringWithFormat:GOODBUYPAGE, self.goodsId, self.userId];
}

- (Class)responseClass {
	return [GoodBuyPageResponse class];
}

@end
