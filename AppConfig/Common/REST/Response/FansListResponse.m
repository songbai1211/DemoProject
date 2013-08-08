//
//  FansListResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "FansListResponse.h"
#import "FansEntity.h"

@implementation FansListResponse

@synthesize curPage;
@synthesize totalPage;
@synthesize totalNum;
@synthesize fansList;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.curPage    = [[responseData valueForKey:@"curpage"] longValue];
    self.totalPage  = [[responseData valueForKey:@"totalpage"] longValue];
    self.totalNum   = [[responseData valueForKey:@"totalnum"] longValue];
    
    NSArray *tempFansList = [responseData valueForKey:@"fanslist"];
    if ((tempFansList == nil) || [tempFansList count] == 0) {
        return;
    }
    
    self.fansList = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *fans in tempFansList) {
        
        FansEntity *fansEntity = [[FansEntity alloc] init];
        
        fansEntity.userId       = [fans valueForKey:@"id"];
        fansEntity.name         = [fans valueForKey:@"name"];
        fansEntity.midPicUrl    = [fans valueForKey:@"midpic"];
        
        [self.fansList addObject:fansEntity];
    }
}

@end

