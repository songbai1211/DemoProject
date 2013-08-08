//
//  BaseRestResponse.h
//  DemoProject
//
//  Created by ll on 13-7-5.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouchXML.h"

@interface BaseRestResponse : NSObject{
    

	NSString *code;
	NSString *description;
    
}

//for XML
//for xinyuan: code = ok, description = reason
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *description;

- (id)initWithXMLElement:(CXMLElement *)xmlElement;
- (void)traverseElement:(CXMLElement *)element;

//for xinyuan JSON
- (id)initWithJSONDic:(NSDictionary *)responseDic;
- (void)traverseJSONDic:(NSDictionary *)responseData;



@end
