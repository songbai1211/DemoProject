//
//  FansListRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "FansListRequest.h"
#import "FansListResponse.h"

@implementation FansListRequest

- (NSString *)url {
    return [NSString stringWithFormat:FANSLIST, self.userId, self.page];
}

- (Class)responseClass {
	return [FansListResponse class];
}

@end
