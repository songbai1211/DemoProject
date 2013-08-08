//
//  StarListRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "StarListRequest.h"
#import "StarListResponse.h"

@implementation StarListRequest

- (NSString *)url {
    return [NSString stringWithFormat:STARLIST, self.page, self.userId];
}

- (Class)responseClass {
	return [StarListResponse class];
}

@end
