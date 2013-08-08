//
//  HotRecommendRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "HotRecommendRequest.h"
#import "HotRecommendResponse.h"

@implementation HotRecommendRequest


- (NSString *)url {
    return [NSString stringWithFormat:HOTRECOMMEND, self.page, self.userId];
}

- (Class)responseClass {
	return [HotRecommendResponse class];
}

@end
