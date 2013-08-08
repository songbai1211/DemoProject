//
//  BaseResponse.m
//  DemoProject
//
//  Created by ll on 13-7-5.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BaseRestResponse.h"



@interface BaseRestResponse(Private)

- (void)traverseResultStateElement:(CXMLElement *)element;

@end


@implementation BaseRestResponse

@synthesize code;
@synthesize description;


#pragma mark - Initialization

- (id)initWithXMLElement:(CXMLElement *)xmlElement {
	self = [super init];
	if ((self != nil) && (xmlElement != nil)) {
        [self traverseResultStateElement:xmlElement];
		[self traverseElement:xmlElement];
	}
	return self;
}


- (id)initWithJSONDic:(NSDictionary *)responseDic
{
    self = [super init];
    if ((self != nil) && (responseDic != nil)) {
        self.code = [responseDic objectForKey:@"ok"];
        self.description = [responseDic objectForKey:@"reason"];
        [self traverseJSONDic:[responseDic objectForKey:@"data"]];
    }
    return self;
}

#pragma mark - Over Write methods

- (void)traverseElement:(CXMLElement *)element {
	
}

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    
}


#pragma mark - Private methods

- (void)traverseResultStateElement:(CXMLElement *)element {
    NSArray *codeNode = [element nodesForXPath:@"//code" error:nil];
    if ([codeNode count] > 0) {
        self.code = [[codeNode objectAtIndex:0] stringValue];
    } else {
        NSDictionary *namespace = [NSDictionary dictionaryWithObject:@"http://www.xxx.com/xyz" forKey:@"ns1"];
        NSArray *resultCodeNode = [element nodesForXPath:@"//ns1:ResultCode" namespaceMappings:namespace error:nil];
        if ([resultCodeNode count] > 0) {
            self.code = [[resultCodeNode objectAtIndex:0] stringValue];
        } else {
            self.code = @"";
        }
    }
    
    NSArray *descriptionNode = [element nodesForXPath:@"//description" error:nil];
    if ([descriptionNode count] > 0) {
        self.description = [[descriptionNode objectAtIndex:0] stringValue];
    } else {
        NSDictionary *namespace = [NSDictionary dictionaryWithObject:@"http://www.xxx.com/xyz" forKey:@"ns1"];
        NSArray *resultDesc = [element nodesForXPath:@"//ns1:ResultDesc" namespaceMappings:namespace error:nil];
        if ([resultDesc count] > 0) {
            self.description = [[resultDesc objectAtIndex:0] stringValue];
        } else {
            self.description = @"";
        }
    }
}


@end