//
//  GoodCommentListRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "GoodCommentListRequest.h"
#import "GoodCommentListResponse.h"

@implementation GoodCommentListRequest

- (NSString *)url {
    return [NSString stringWithFormat:GOODCOMMENTLIST, self.goodsId, self.page];
}

- (Class)responseClass {
	return [GoodCommentListResponse class];
}

@end
