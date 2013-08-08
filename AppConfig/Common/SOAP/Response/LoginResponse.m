//
//  LoginResponse.m
//
//  Copyright 2012年 Twin-Fish. All rights reserved.
//

#import "LoginResponse.h"

@implementation LoginResponse

@synthesize userID      = userID_;
@synthesize name        = name_;
@synthesize password    = password_;
@synthesize session     = session_;


/*****************************************************************************
 函数名 ：traverseElement
 功能描述 ：Get entity information from SOAP response string
 返回值 ：无
******************************************************************************/
- (void)traverseElement:(CXMLElement *)element {

    self.userID     = [[element nodeForXPath:@"//userID" error:nil] stringValue];
    self.name       = [[element nodeForXPath:@"//name" error:nil] stringValue];
    self.password   = [[element nodeForXPath:@"//password" error:nil] stringValue];
    self.session    = [[element nodeForXPath:@"//session" error:nil] stringValue];
}

-(id)copyWithZone:(NSZone *)zone
{
    LoginResponse *copy = [[[self class] allocWithZone:zone] init];
    
    if (copy != nil) {
        copy->session_   = [session_ copy];
        copy->userID_    = [userID_ copy];
        copy->name_      = [name_ copy];
        copy->password_  = [password_ copy];
    }
    return copy;
}

@end
