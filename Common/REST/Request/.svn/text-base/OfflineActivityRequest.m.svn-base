//
//  OfflineActivityRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "OfflineActivityRequest.h"
#import "OfflineActivityResponse.h"

@implementation OfflineActivityRequest


- (NSString *)url {
    return [NSString stringWithFormat:OFFLINEACTIVITY, self.page, self.userId];
}

- (Class)responseClass {
	return [OfflineActivityResponse class];
}

@end
