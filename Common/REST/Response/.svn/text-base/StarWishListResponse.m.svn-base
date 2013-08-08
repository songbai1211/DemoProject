//
//  StarWishListResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "StarWishListResponse.h"

@implementation StarWishListResponse

@synthesize curPage;
@synthesize totalPage;
@synthesize totalNum;
@synthesize wishList;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.curPage    = [[responseData valueForKey:@"curpage"] longValue];
    self.totalPage  = [[responseData valueForKey:@"totalpage"] longValue];
    self.totalNum   = [[responseData valueForKey:@"totalnum"] longValue];
    
    NSArray *tempWishList = [responseData valueForKey:@"wishlist"];
    if ((tempWishList == nil) || [tempWishList count] == 0) {
        return;
    }
    
    self.wishList = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *wish in tempWishList) {
        
        WishEntity *wishEntity  = [[WishEntity alloc] init];
        wishEntity.wishId       = [wish valueForKey:@"id"];
        wishEntity.wishContent  = [wish valueForKey:@"wishcontent"];
        wishEntity.supportNum   = [[wish valueForKey:@"supportnum"] longValue];
        wishEntity.isSupported  = [[wish valueForKey:@"issupported"] boolValue];
        
        [self.wishList addObject:wishEntity];
    }
}

@end
