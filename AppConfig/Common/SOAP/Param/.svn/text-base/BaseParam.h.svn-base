//
//  BaseParam.h
//
//  Copyright 2012年 Twin-Fish. All rights reserved.
//

#import <Foundation/Foundation.h>


#define WEB_SERVICE_URL     @"http://www.xxx.com/webservice/"
#define SOAP_ACTION_TYPES   @"http://www.xxx.com/webservice/types"

#define XML_HEADER          @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
#define SOAP_ENV_START      @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\"\
                                xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"\
                                xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\
                                xmlns:typ=\"http://www.xxx.com/webservice/types\">"
#define SOAP_ENV_END        @"</soapenv:Envelope>"
#define SOAP_HEADER_START   @"<soapenv:Header><Version xmlns=\"http://www.xxx.com/webservice/types\">%@</Version>" 
#define SOAP_HEADER_END     @"</soapenv:Header>"
#define SOAP_BODY_START     @"<soapenv:Body>"
#define SOAP_BODY_END       @"</soapenv:Body>"


@interface BaseParam : NSObject {
@public
    NSString *soapAction;
    NSString *soapActionUrl;
    NSString *actionNameXmlns;
    NSString *soapParamHead;
    NSString *soapFoot;
    
    NSString *authentication;
}

@property (nonatomic, retain) NSString *soapAction;
@property (nonatomic, retain) NSString *soapActionUrl;
@property (nonatomic, retain) NSString *actionNameXmlns;
@property (nonatomic, retain) NSString *soapParamHead;
@property (nonatomic, retain) NSString *soapFoot;
@property (nonatomic, retain) NSString *authentication;

- (NSString *)stringValue;
- (void *)httpHeadValue:(NSMutableURLRequest *)httppRequest;
- (NSData *)httpBodyData;

@end
