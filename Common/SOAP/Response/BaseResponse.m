//
//  BaseResponse.m
//
//  Copyright 2012年 Twin-Fish. All rights reserved.
//

#import "BaseResponse.h"
#import "BaseRequest.h"
#import <objc/runtime.h>
#import "UIFactory.h"


@interface BaseResponse(Private)

- (void)traverseResultStateElement:(CXMLElement *)element;

@end


@implementation BaseResponse

@synthesize code;
@synthesize description;


#pragma mark - Initialization

- (id)initWithXMLElement:(CXMLElement *)xmlElement {
	self = [super init];
	if (self != nil && xmlElement != nil) {
        [self traverseResultStateElement:xmlElement];
		[self traverseElement:xmlElement];
	}
	return self;
}


#pragma mark - Over Write methods

- (void)traverseElement:(CXMLElement *)element {
	
}


#pragma mark - Private methods

- (void)traverseResultStateElement:(CXMLElement *)element {
    NSArray *codeNode = [element nodesForXPath:@"//code" error:nil];
    if ([codeNode count] > 0) {
        self.code = [[codeNode objectAtIndex:0] stringValue];
    } else {
        NSDictionary *namespace = [NSDictionary dictionaryWithObject:@"http://www.huawei.com/ims/mediax" forKey:@"ns1"];
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
