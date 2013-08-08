//
//  StarWishListRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "StarWishListRequest.h"
#import "StarWishListResponse.h"

@implementation StarWishListRequest

- (NSString *)url {
    return [NSString stringWithFormat:STARWISHLIST, self.starId, self.page, self.userId];
}

- (Class)responseClass {
	return [StarWishListResponse class];
}

@end
