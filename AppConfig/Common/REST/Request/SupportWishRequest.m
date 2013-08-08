//
//  SupportWishRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "SupportWishRequest.h"
#import "SupportWishResponse.h"

@implementation SupportWishRequest

@synthesize wishId;

- (NSString *)url {
    return [NSString stringWithFormat:SUPPORTWISH, self.wishId, self.userId, self.op];
}

- (Class)responseClass {
	return [SupportWishResponse class];
}

@end
