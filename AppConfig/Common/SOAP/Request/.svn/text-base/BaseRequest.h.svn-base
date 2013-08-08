//
//  BaseRequest.h
//  SmartMeeting
//
//  Created by luddong on 12-3-23.
//  Copyright 2012年 Twin-Fish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import "BaseParam.h"

@class BaseRequest,NSError;
@protocol RequestDelegate;


@interface BaseRequest : NSObject {
    
@private
    NSURLConnection *connection_;
    NSMutableURLRequest *httpRequest_;
    NSMutableData *receivedData_;

    BOOL isRequesting_;
    SEL didFinishSelector_;
    SEL didFailSelector_;

}

@property (nonatomic, assign) id<RequestDelegate> delegate;
@property (nonatomic, readonly) BOOL isRequesting;
@property (nonatomic, readonly) Class responseClass;
@property (nonatomic, readonly) NSString *requestName;

@property (nonatomic, assign) SEL didFinishSelector;
@property (nonatomic, assign) SEL didFailSelector;

- (id)initWithDelegate:(NSObject *)requestDelegate;
- (void)closeConnection;

- (BOOL)sendGetRequestWithParam:(BaseParam *)param;
- (BOOL)sendPutRequestWithParam:(BaseParam *)param;
- (BOOL)sendPostRequestWithParam:(BaseParam *)param;
- (BOOL)sendDeleteRequestWithParam:(BaseParam *)param;

@end


@protocol RequestDelegate <NSObject>

@optional
- (void)request:(BaseRequest *)request didFinishWithResponse:(BaseResponse *)response;
- (void)request:(BaseRequest *)request didFailWithError:(NSError *)error;

@end
