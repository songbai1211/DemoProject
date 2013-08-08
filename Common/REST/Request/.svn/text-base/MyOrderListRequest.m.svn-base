//
//  MyOrderListRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "MyOrderListRequest.h"
#import "MyOrderListResponse.h"

@implementation MyOrderListRequest

- (NSString *)url {
    return [NSString stringWithFormat:MYORDERLIST, self.userId, self.page, self.type];
}

- (Class)responseClass {
	return [MyOrderListResponse class];
}

@end
