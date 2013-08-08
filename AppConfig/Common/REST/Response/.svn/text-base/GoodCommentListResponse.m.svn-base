//
//  GoodCommentListResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "GoodCommentListResponse.h"
#import "CommentEntity.h"

@implementation GoodCommentListResponse

@synthesize curPage;
@synthesize totalPage;
@synthesize totalNum;
@synthesize commentList;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.curPage    = [[responseData valueForKey:@"curpage"] longValue];
    self.totalPage  = [[responseData valueForKey:@"totalpage"] longValue];
    self.totalNum   = [[responseData valueForKey:@"totalnum"] longValue];
    
    NSArray *tempCommentList = [responseData valueForKey:@"commentlist"];
    if ((tempCommentList == nil) || [tempCommentList count] == 0) {
        return;
    }
    
    self.commentList = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *comment in tempCommentList) {
        
        CommentEntity *commentEntity = [[CommentEntity alloc] init];
        commentEntity.commentId     = [comment valueForKey:@"id"];
        commentEntity.userId        = [comment valueForKey:@"userid"];
        commentEntity.name          = [comment valueForKey:@"name"];
        commentEntity.midPicUrl     = [comment valueForKey:@"midpic"];
        commentEntity.content       = [comment valueForKey:@"content"];
        commentEntity.time          = [[comment valueForKey:@"time"] longValue];
        
        [self.commentList addObject:commentEntity];
    }
}


@end
