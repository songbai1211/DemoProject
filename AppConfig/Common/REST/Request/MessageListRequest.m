//
//  MessageListRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "MessageListRequest.h"
#import "MessageListResponse.h"

@implementation MessageListRequest

- (NSString *)url {
    return [NSString stringWithFormat:MESSAGELIST, self.userId, self.page];
}

- (Class)responseClass {
	return [MessageListResponse class];
}

@end
