//
//  BaseRequest.m
//  HuaweiMeeting
//
//  Created by LuDdong on 11/06/29.
//  Copyright 2011 Twin-Fish. All rights reserved.
//

#import "BaseRequest.h"
#import "BaseResponse.h"

#import "MMLog.h"
#import "TouchXML.h"
#import "NetworkConfig.h"




#define SERVICEADDRESS  @"www.xxx.com"


@interface BaseRequest (private)

- (BOOL) createConnectionWithRequest:(NSURLRequest *)request delegate:(id)mDelegate;

@end


@implementation BaseRequest

@synthesize delegate;
@synthesize isRequesting        = isRequesting_;
@synthesize didFailSelector     = didFailSelector_;
@synthesize didFinishSelector   = didFinishSelector_;


- (Class)responseClass {
	return nil;
}

- (NSString *)requestName {
    return nil;
}


/*****************************************************************************
 函数名 ：initWithDelegate
 功能描述 ：Initialize delegate
 返回值 ：id
 ******************************************************************************/
- (id)initWithDelegate:(NSObject *)requestDelegate {
    self = [super init];
    if (self) {
        self.delegate = (id<RequestDelegate>)requestDelegate;
        isRequesting_ = NO; 
    }
    return self;
}

/*****************************************************************************
 函数名 ：closeConnection
 功能描述 ：Close connection and release
 输入参数 ：无
 输出参数 ：无
 返回值 ：无
 ******************************************************************************/
- (void)closeConnection {
    if (connection_ != nil) {
        [connection_ cancel];
        connection_ = nil;
    }
    if (receivedData_ != nil) {
        receivedData_ = nil;
    }
    if (httpRequest_ != nil) {
        httpRequest_ = nil;
    }
    
    self.delegate = nil;
}



/*****************************************************************************
 函数名 ：sendGetRequestWithParam
 功能描述 ：Get some information through SOAP request with parameters
 返回值 ：BOOL
 ******************************************************************************/
- (BOOL)sendGetRequestWithParam:(BaseParam *)param 
{
    if (!isRequesting_) {
        isRequesting_ = YES;
        receivedData_ = [[NSMutableData alloc] init];
        NSString *soapUrlstring = [NSString stringWithFormat:@"%@/%@", SERVICEADDRESS, [param stringValue]];
        httpRequest_ = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:soapUrlstring]
                                                    cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                timeoutInterval:REQUEST_TIME_OUT];
        [param httpHeadValue:httpRequest_];
        [httpRequest_ setHTTPMethod:@"GET"];
        MMLogDebug(@"class = %@,  requestParamString:\n%@",[self class], soapUrlstring);
        
        return [self createConnectionWithRequest:httpRequest_ delegate:self];
    } else {
        return NO;
    }
}


- (BOOL)sendPutRequestWithParam:(BaseParam *)param
{
    if (!isRequesting_) {
        isRequesting_ = YES;
        receivedData_ = [[NSMutableData alloc] init];
        
        NSString *soapUrlstring = [NSString stringWithFormat:@"%@/%@", SERVICEADDRESS, [param stringValue]];
        httpRequest_ = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:soapUrlstring]
                                                    cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                timeoutInterval:REQUEST_TIME_OUT];
        
        [param httpHeadValue:httpRequest_];
        [httpRequest_ setHTTPMethod:@"PUT"];
        [httpRequest_ setHTTPBody:[param httpBodyData]];
        MMLogDebug(@"class = %@,  requestParamString:\n%@",[self class], soapUrlstring);
        
        return [self createConnectionWithRequest:httpRequest_ delegate:self];

    } else {
        return NO;
    }
}



/*****************************************************************************
 函数名 ：sendPostRequestWithParam
 功能描述 ：Common function to send SOAP request with parameters
 返回值 ：BOOL
 ******************************************************************************/
- (BOOL)sendPostRequestWithParam:(BaseParam *)param {
    if (!isRequesting_) {
        isRequesting_ = YES;
        receivedData_ = [[NSMutableData alloc] init];
        
        NSString *soapUrlstring = SERVICEADDRESS;
        httpRequest_ = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:soapUrlstring]
                                                    cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                timeoutInterval:REQUEST_TIME_OUT];
        
        [httpRequest_ setValue:@"text/xml" forHTTPHeaderField:@"Content-type"];
        [httpRequest_ setValue:@"AppName" forHTTPHeaderField:@"User-Agent"];
        
        NSMutableString *soapActionstring = [[NSMutableString alloc] init];
        [soapActionstring appendString:@"\""];
        [soapActionstring appendString:param.soapActionUrl];
        [soapActionstring appendString:@"\""];
        
        [httpRequest_ setValue:soapActionstring forHTTPHeaderField:@"SOAPAction"];
        [httpRequest_ setHTTPMethod:@"POST"];
        NSString *requestParamString = [param stringValue];
        [httpRequest_ setHTTPBody:[requestParamString dataUsingEncoding:NSUTF8StringEncoding]];
        MMLogDebug(@"class = %@,  requestParamString:\n%@",[self class], requestParamString);
        return [self createConnectionWithRequest:httpRequest_ delegate:self];
        
    } else {
        return NO;
    }
}

- (BOOL)sendDeleteRequestWithParam:(BaseParam *)param
{
    if (!isRequesting_) {
        isRequesting_ = YES;
        receivedData_ = [[NSMutableData alloc] init];
     
        NSString *soapUrlstring = [NSString stringWithFormat:@"%@/%@", SERVICEADDRESS, [param stringValue]];
        httpRequest_ = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:soapUrlstring]
                                                    cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                timeoutInterval:REQUEST_TIME_OUT];
        
        [param httpHeadValue:httpRequest_];
        [httpRequest_ setHTTPMethod:@"DELETE"];
        [httpRequest_ setHTTPBody:[param httpBodyData]];
        MMLogDebug(@"class = %@,  requestParamString:\n%@",[self class], soapUrlstring);
        return [self createConnectionWithRequest:httpRequest_ delegate:self];
    } else {
        return NO;
    }
}



#pragma mark - NSURLConnection delegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [receivedData_ setLength:0];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    if (data && [data length] > 0) {
        [receivedData_ appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
 
    isRequesting_ = NO;
    NSString *receivedDataString = [[NSString alloc] initWithData:receivedData_ encoding:NSUTF8StringEncoding];
    MMLogDebug(@"class = %@,  Response:\n%@", [self class], receivedDataString);

    if ([receivedDataString length] == 0) {
        BaseResponse *response = [[[self responseClass] alloc] init];
        response.code = REQUEST_FAILED;
        if (self.delegate != nil &&
            [self.delegate respondsToSelector:@selector(request:didFinishWithResponse:)]) {
            [self.delegate request:self didFinishWithResponse:response];
        }
    } else {
        CXMLDocument *theXmlDocument = [[CXMLDocument alloc] initWithXMLString:receivedDataString options:0 error:nil];    
        CXMLElement *element = [theXmlDocument rootElement];
        
        if(element) {
            BaseResponse *response = [[[self responseClass] alloc] initWithXMLElement:element];
            if (self.delegate != nil) {
                if ([self.delegate respondsToSelector:@selector(request:didFinishWithResponse:)]) {
                    [self.delegate request:self didFinishWithResponse:response];
                } else if ([self.delegate respondsToSelector:didFinishSelector_]) {
                    [self performSelector:didFinishSelector_ withObject:self withObject:response];
                }
            }
        }else {
            MMLogDebug(@"The received response XML parsing failed.");
            //服务器返回异常报文,解析失败
            if (self.delegate != nil) {
                if ([self.delegate respondsToSelector:@selector(request:didFailWithError:)]) {
                    [self.delegate request:self didFailWithError:nil];
                } else if ([self.delegate respondsToSelector:@selector(didFailSelector)]) {
                    [self.delegate performSelector:didFinishSelector_ withObject:self withObject:nil];
                }
            }
        }
    }
    [self closeConnection];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    isRequesting_ = NO;
    MMLogDebug(@"class = %@,  Error = %@", [self class], error.description);
    
    if (self.delegate != nil) {
        if ([self.delegate respondsToSelector:@selector(request:didFailWithError:)]) {
            [self.delegate request:self didFailWithError:nil];
        } else if ([self.delegate respondsToSelector:@selector(didFailSelector)]) {
            [self.delegate performSelector:didFinishSelector_ withObject:self withObject:nil];
        }
    }
    [self closeConnection];
}

#pragma mark - Private

- (BOOL) createConnectionWithRequest:(NSURLRequest *)request delegate:(id)mDelegate
{
    connection_ = [[NSURLConnection alloc] initWithRequest:request delegate:mDelegate];
    if (connection_) {
        return YES;
    } else {
        return NO;
    }
}

@end
