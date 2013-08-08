//
//  StarListResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "StarListResponse.h"

@implementation StarListResponse

@synthesize curPage;
@synthesize totalPage;
@synthesize totalNum;
@synthesize starList;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.curPage    = [[responseData valueForKey:@"curpage"] longValue];
    self.totalPage  = [[responseData valueForKey:@"totalpage"] longValue];
    self.totalNum   = [[responseData valueForKey:@"totalnum"] longValue];
    
    NSArray *tempStarList = [responseData valueForKey:@"starlist"];
    if ((tempStarList == nil) || [tempStarList count] == 0) {
        return;
    }
    
    self.starList = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *star in tempStarList) {

        StarEntity *starEntity    = [[StarEntity alloc] init];
        starEntity.userId           = [star valueForKey:@"id"];
        starEntity.fansNum          = [[star valueForKey:@"fansnum"] longValue];
        starEntity.goodsNum         = [[star valueForKey:@"goodsnum"] longValue];
        starEntity.isInterest       = [[star valueForKey:@"isinterest"] boolValue];
        starEntity.name             = [star valueForKey:@"name"];
        starEntity.midPicUrl        = [star valueForKey:@"midpic"];
      
        [self.starList addObject:starEntity];
    }
}

@end
