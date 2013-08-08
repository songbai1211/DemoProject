//
//  MessageListResponse.m
//  DemoProject
//
//  Created by apple on 13-7-16.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "MessageListResponse.h"
#import "messageEntity.h"

@implementation MessageListResponse

@synthesize curPage;
@synthesize totalPage;
@synthesize totalNum;
@synthesize messageList;

- (void)traverseJSONDic:(NSDictionary *)responseData
{
    if ((responseData == nil) || [responseData count] == 0) {
        return;
    }
    
    self.curPage    = [[responseData valueForKey:@"curpage"] longValue];
    self.totalPage  = [[responseData valueForKey:@"totalpage"] longValue];
    self.totalNum   = [[responseData valueForKey:@"totalnum"] longValue];
    
    
    NSArray *tempMessageList = [responseData valueForKey:@"msglist"];
    if ((tempMessageList == nil) || [tempMessageList count] == 0) {
        return;
    }
    
    self.messageList = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *msg in tempMessageList) {
        
        MessageEntity *msgEntity = [[MessageEntity alloc] init];
        
        msgEntity.messageId = [msg valueForKey:@"id"];
        msgEntity.readFlag  = [[msg valueForKey:@"readflag"] boolValue];
        msgEntity.type      = [[msg valueForKey:@"msgtype"] longValue];
        
        NSDictionary *messageBody = [msg valueForKey:@"msg"];
        
        switch (msgEntity.type) {
            case MESSAGE_STAR:
            {
                msgEntity.starMessage = [[StarMessage alloc] init];
                msgEntity.starMessage.starId        = [messageBody valueForKey:@"id"];
                msgEntity.starMessage.name          = [messageBody valueForKey:@"name"];
                msgEntity.starMessage.smallPicUrl   = [messageBody valueForKey:@"smallpic"];
                msgEntity.starMessage.content       = [messageBody valueForKey:@"content"];
                
                break;
            }
       
            case MESSAGE_GOOD:
            {
                msgEntity.goodMessage = [[GoodMessage alloc] init];
                msgEntity.goodMessage.goodId        = [messageBody valueForKey:@"goodsid"];
                msgEntity.goodMessage.goodName      = [messageBody valueForKey:@"goodsname"];
                msgEntity.goodMessage.content       = [messageBody valueForKey:@"content"];
                msgEntity.goodMessage.starId        = [messageBody valueForKey:@"starid"];
                msgEntity.goodMessage.starName      = [messageBody valueForKey:@"starname"];
                msgEntity.goodMessage.starPicUrl    = [messageBody valueForKey:@"starpic"];

                break;
            }
            case MESSAGE_ORDER:
            {
                msgEntity.orderMessage = [[OrderMessage alloc] init];
                
                break;
            }
            default:
                break;
        }
        
        [self.messageList addObject:msgEntity];
    }
}

@end
