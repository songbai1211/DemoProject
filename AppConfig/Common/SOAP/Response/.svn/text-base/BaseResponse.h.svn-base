//
//  BaseResponse.h
//
//  Copyright 2012年 Twin-Fish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouchXML.h"

@interface BaseResponse : NSObject {
	NSString *code;
	NSString *description;
}

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *description;

- (id)initWithXMLElement:(CXMLElement *)xmlElement;
- (void)traverseElement:(CXMLElement *)element;

@end
