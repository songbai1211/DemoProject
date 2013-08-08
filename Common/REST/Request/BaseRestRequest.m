//
//  BaseRestRequest.m
//  DemoProject
//
//  Created by ll on 13-7-5.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BaseRestRequest.h"
#import "BaseRestResponse.h"

#import "UIFactory.h"
#import "AppConfig.h"
#import "AppDelegate_iphone.h"

#define REQUEST_TIME_OUT            30
#define kDefaultLoginSessionKey     @"session"
#define HTTPHEAD_SESSION_KEY        @"session"


@implementation BaseRestRequest

@synthesize userId;
@synthesize parameters;

- (NSString *)session
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kDefaultLoginSessionKey];
}

- (NSString *)url {
    return nil;
}

- (NSString *)requestName {
    return nil;
}

- (Class)responseClass {
	return nil;
}


- (void)sendJSONRequestWithSuccess:(void (^)(BaseRestRequest *request, BaseRestResponse *response))success
                           Failure:(void (^)(BaseRestRequest *request, NSError *error))failure
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]
                                                           cachePolicy:NSURLCacheStorageNotAllowed
                                                       timeoutInterval:REQUEST_TIME_OUT];
    [request setValue:self.session forHTTPHeaderField:HTTPHEAD_SESSION_KEY];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSDictionary *dic = (NSDictionary *)JSON;
            if (dic != nil) {
                BaseRestResponse *response = [[[self responseClass] alloc] initWithJSONDic:dic];
                if (response != nil && success) {
                    success(self, response);
                }
            } else {
                
                //返回应答异常
                if (failure) {
                    failure(self, nil);
                }
            }
        }
        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            
            //请求失败
            if (failure) {
                failure(self, error);
            }
           }];
    
    [operation start];
    
}



- (void)sendXMLRequestWithSuccess:(void (^)(BaseRestRequest *request, BaseRestResponse *response))success
                          Failure:(void (^)(BaseRestRequest *request, NSError *error))failure
{

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]
                                                           cachePolicy:NSURLCacheStorageNotAllowed
                                                       timeoutInterval:REQUEST_TIME_OUT];
    [request setValue:self.session forHTTPHeaderField:HTTPHEAD_SESSION_KEY];
    
    AFXMLRequestOperation *operation =
    [AFXMLRequestOperation XMLDocumentRequestOperationWithRequest:request
          success:^(NSURLRequest *request, NSHTTPURLResponse *response, CXMLDocument *document) {
              CXMLElement *element = [document rootElement];
              if (element) {
                  BaseRestResponse *response = [[[self responseClass] alloc] initWithXMLElement:element];
                  if (response != nil && success) {
                      success(self, response);
                  }  
              } else {
         
                  if (failure) {
                      failure(self, nil);
                  }
              }
              
          } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, CXMLDocument *document) {
              if (failure) {
                  failure(self, error);
              }
          }];
    
    [operation start];
}



- (void)sendGETRequestWithSuccess:(void (^)(BaseRestRequest *request, BaseRestResponse *response))success
                          Failure:(void (^)(BaseRestRequest *request, NSError *error))failure
{
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:self.url]];
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    [client setDefaultHeader:HTTPHEAD_SESSION_KEY value:self.session];
    
    [client getPath:self.url
         parameters:parameters
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSDictionary *dic = (NSDictionary *)responseObject;
                if (dic != nil) {
                    BaseRestResponse *response = [[[self responseClass] alloc] initWithJSONDic:dic];
                    if (response != nil && success) {
                        success(self, response);
                    }
                } else {

                    if (failure) {
                        failure(self, nil);
                    }
                }
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
                if (failure) {
                    failure(self, error);
                }
            }];
}



- (void)sendPOSTRequestWithSuccess:(void (^)(BaseRestRequest *request, BaseRestResponse *response))success
                           Failure:(void (^)(BaseRestRequest *request, NSError *error))failure
{

    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:self.url]];
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    [client setDefaultHeader:HTTPHEAD_SESSION_KEY value:self.session];
    
    [client postPath:self.url
          parameters:parameters
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 NSDictionary *dic = (NSDictionary *)responseObject;
                 if (dic != nil) {
                     BaseRestResponse *response = [[[self responseClass] alloc] initWithJSONDic:dic];
                     if (response != nil && success) {
                         success(self, response);
                     }
                 } else {
                     
                     //异常
                     if (failure) {
                         failure(self, nil);
                     }
                 }
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 //异常
                 if (failure) {
                     failure(self, error);
                 }
             }];
}


- (void)downLoadImageWithSuccess:(void (^)(BaseRestRequest *request, BaseRestResponse *response))success
                         Failure:(void (^)(BaseRestRequest *request, NSError *error))failure
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]
                                                           cachePolicy:NSURLCacheStorageNotAllowed
                                                       timeoutInterval:REQUEST_TIME_OUT];
    [request setValue:self.session forHTTPHeaderField:HTTPHEAD_SESSION_KEY];
    
    AFImageRequestOperation *operation =
    [AFImageRequestOperation imageRequestOperationWithRequest:request
         imageProcessingBlock:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
             
         } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
             
         }];
    [operation start];
}



//断点下载
+ (AFDownloadRequestOperation *)resumingDownLoadFileWithUrl:(NSString *)url
                                              ProgressBlock:(void (^)(NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile))progressBlock
                                 CompletionBlockWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:3600];

    NSString *target = [[NSFileManager docPath] stringByAppendingPathComponent:@"test"];
    AFDownloadRequestOperation *operation = [[AFDownloadRequestOperation alloc] initWithRequest:request targetPath:target shouldResume:YES];
    [operation setCompletionBlockWithSuccess:success failure:failure];
    [operation setProgressiveDownloadProgressBlock:progressBlock];
    [operation start];
    return operation;
}



#pragma mark - Error

- (void)showAlertError:(NSError *)error
{
    if (error == nil) {
        [UIFactory showAlert:[UIFactory localized:@"Request_ServerError"]];
    }
    if ([error.domain isEqualToString:NSURLErrorDomain]) {
        switch (error.code) {
            case NSURLErrorCannotConnectToHost:
            case NSURLErrorCannotFindHost:
            case NSURLErrorNetworkConnectionLost:
            case NSURLErrorDNSLookupFailed:
            case NSURLErrorNotConnectedToInternet:
                [UIFactory showAlert:[UIFactory localized:@"Request_ConnectError"]];
                break;
                
            case NSURLErrorTimedOut:
                [UIFactory showAlert:[UIFactory localized:@"Request_TimeOutError"]];
                break;
                
            default:
                [UIFactory showAlert:[UIFactory localized:@"Request_ConnectError"]];
                break;
        }
    }
}

@end
