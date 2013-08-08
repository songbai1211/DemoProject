//
//  SpecialWishRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "SpecialWishRequest.h"
#import "SpecialWishResponse.h"

@implementation SpecialWishRequest

- (NSString *)url {
    return [NSString stringWithFormat:SPECIALWISH, self.page, self.userId];
}

- (Class)responseClass {
	return [SpecialWishResponse class];
}

@end
