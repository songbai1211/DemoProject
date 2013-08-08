//
//  StartPageRequest.m
//  DemoProject
//
//  Created by name on 13-7-7.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "StartPageRequest.h"
#import "StartPageResponse.h"

@implementation StartPageRequest

@synthesize version;

- (NSString *)url {
    return [NSString stringWithFormat:STARTPAGE, self.version];
}

- (Class)responseClass {
	return [StartPageResponse class];
}

@end
