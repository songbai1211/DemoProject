//
//  FollowStarListResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "FollowStarListResponse.h"
#import "StarEntity.h"

@implementation FollowStarListResponse

@synthesize curPage;
@synthesize totalPage;
@synthesize totalNum;
@synthesize followStarList;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.curPage    = [[responseData valueForKey:@"curpage"] longValue];
    self.totalPage  = [[responseData valueForKey:@"totalpage"] longValue];
    self.totalNum   = [[responseData valueForKey:@"totalnum"] longValue];
    
    NSArray *tempFollowStarList = [responseData valueForKey:@"starlist"];
    if ((tempFollowStarList == nil) || [tempFollowStarList count] == 0) {
        return;
    }
    
    self.followStarList = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *star in tempFollowStarList) {
        
        StarEntity *starEntity = [[StarEntity alloc] init];
        
        starEntity.userId       = [star valueForKey:@"id"];
        starEntity.name         = [star valueForKey:@"name"];
        starEntity.fansNum      = [[star valueForKey:@"fansnum"] longValue];
        starEntity.midPicUrl    = [star valueForKey:@"midpic"];
        starEntity.goodsNum     = [[star valueForKey:@"goodsnum"] longValue];
        
        [self.followStarList addObject:starEntity];
    }
}

@end
