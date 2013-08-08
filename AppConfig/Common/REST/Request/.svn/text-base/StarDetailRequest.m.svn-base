//
//  StarDetailRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "StarDetailRequest.h"
#import "StarDetailResponse.h"

@implementation StarDetailRequest

- (NSString *)url {
    return [NSString stringWithFormat:STARLIST, self.page, self.userId];
}

- (Class)responseClass {
	return [StarDetailResponse class];
}

@end
