//
//  LoginParam.m
//
//  Copyright 2012年 Twin-Fish. All rights reserved.
//

#import "LoginParam.h"


@implementation LoginParam

@synthesize name;
@synthesize password;

#pragma mark - Public method


- (id)init {
    self = [super init];
    if (self) {
        
        self.soapAction = LOGIN_SOAP_ACTION_NAME;
        self.soapActionUrl = [NSString stringWithFormat:@"%@%@", WEB_SERVICE_URL, LOGIN_ACTION_PATH];
        self.actionNameXmlns = SOAP_ACTION_TYPES;
    }
    return self;
}

/*****************************************************************************
 函数名 ：stringValue
 功能描述 ：Make SOAP parameter strings 
 返回值 ：parameter string
 ******************************************************************************/
- (NSString *)stringValue {
    NSMutableString *paramString = [[NSMutableString alloc] init];
    [paramString appendString:self.soapParamHead];
    [paramString appendFormat:@"<%@>", self.soapAction];
    [paramString appendFormat:@"<account><name>%@</name><password>%@</password></account>", self.name, self.password];
    [paramString appendFormat:@"</%@>", self.soapAction];
    [paramString appendString:self.soapFoot];
    return paramString;
}

@end
