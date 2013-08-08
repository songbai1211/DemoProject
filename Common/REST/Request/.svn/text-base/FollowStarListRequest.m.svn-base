//
//  FollowStarListRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "FollowStarListRequest.h"
#import "FollowStarListResponse.h"

@implementation FollowStarListRequest

- (NSString *)url {
    return [NSString stringWithFormat:FOLLOWSTARLIST, self.userId, self.page];
}

- (Class)responseClass {
	return [FollowStarListResponse class];
}

@end
