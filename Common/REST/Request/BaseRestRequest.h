//
//  BaseRestRequest.h
//  DemoProject
//
//  Created by ll on 13-7-5.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class BaseRestRequest;
@class BaseRestResponse;

@interface BaseRestRequest : NSObject


@property(nonatomic, copy)NSString *userId;
@property(nonatomic, retain)NSMutableDictionary *parameters;

@property (nonatomic, readonly) NSString *session;
@property (nonatomic, readonly) NSString *url;
@property (nonatomic, readonly) NSString *requestName;
@property (nonatomic, readonly) Class responseClass;



//断点下载
+ (AFDownloadRequestOperation *)resumingDownLoadFileWithUrl:(NSString *)url
                                              ProgressBlock:(void (^)(NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile))progressBlock
                                 CompletionBlockWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;



- (void)sendJSONRequestWithSuccess:(void (^)(BaseRestRequest *request, BaseRestResponse *response))success
                           Failure:(void (^)(BaseRestRequest *request, NSError *error))failure;

- (void)sendXMLRequestWithSuccess:(void (^)(BaseRestRequest *request, BaseRestResponse *response))success
                          Failure:(void (^)(BaseRestRequest *request, NSError *error))failure;

- (void)sendGETRequestWithSuccess:(void (^)(BaseRestRequest *request, BaseRestResponse *response))success
                          Failure:(void (^)(BaseRestRequest *request, NSError *error))failure;

- (void)sendPOSTRequestWithSuccess:(void (^)(BaseRestRequest *request, BaseRestResponse *response))success
                           Failure:(void (^)(BaseRestRequest *request, NSError *error))failure;

- (void)downLoadImageWithSuccess:(void (^)(BaseRestRequest *request, BaseRestResponse *response))success
                         Failure:(void (^)(BaseRestRequest *request, NSError *error))failure;

- (void)showAlertError:(NSError *)error;

@end





//API接口
/*登录 POST接口*/
#define LOGIN               @"http://host:port/user/login/"










