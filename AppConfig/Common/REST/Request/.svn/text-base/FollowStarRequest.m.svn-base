//
//  FollowStarRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "FollowStarRequest.h"
#import "FollowStarResponse.h"

@implementation FollowStarRequest

- (NSString *)url {
    return [NSString stringWithFormat:FOLLOWSTAR, self.starId, self.userId, self.op];
}

- (Class)responseClass {
	return [FollowStarResponse class];
}

@end
