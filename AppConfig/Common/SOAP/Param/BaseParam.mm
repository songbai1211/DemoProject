//
//  BaseParam.m
//
//  Copyright 2012年 Twin-Fish. All rights reserved.
//

#import "BaseParam.h"


@implementation BaseParam

@synthesize soapAction;
@synthesize soapActionUrl;
@synthesize actionNameXmlns;
@synthesize soapParamHead;
@synthesize soapFoot;
@synthesize authentication;



#pragma mark - Public method

- (id)init {
    self = [super init];
    if (self) {
        NSMutableString *head = [[NSMutableString alloc] init];
        [head appendString:XML_HEADER];
        [head appendString:SOAP_ENV_START];
        [head appendString:[NSString stringWithFormat:SOAP_HEADER_START, @"V000000XX"]];
        [head appendString:SOAP_HEADER_END];
        [head appendString:SOAP_BODY_START];
        self.soapParamHead = head;
        
        NSMutableString *foot = [[NSMutableString alloc] init];
        [foot appendString:SOAP_BODY_END];
        [foot appendString:SOAP_ENV_END];
        self.soapFoot = foot;
    }
    return self;
}

/*****************************************************************************
 函数名 ：stringValue
 功能描述 ：Make SOAP parameter strings 
 返回值 ：parameter string
 ******************************************************************************/
- (NSString *)stringValue {
    return nil;
}

- (void *)httpHeadValue:(NSMutableURLRequest *)httpRequest
{
    return nil;
}

- (NSData *)httpBodyData
{
    return nil;
}

@end
