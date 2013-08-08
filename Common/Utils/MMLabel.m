//
//  MMLabel.m
//  DemoProject
//
//  Created by name on 13-8-5.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "MMLabel.h"

@implementation MMLabel

@synthesize delegate = _delegate;
@synthesize didTouch = _didTouch;
@synthesize isChangeAlpha;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        isChangeAlpha = YES;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    if(isChangeAlpha) {
        self.alpha = 0.5;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    [super touchesMoved: touches withEvent: event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    if(isChangeAlpha){
        self.alpha = 1;
    }
   
    BOOL inside = YES;
    for(int i=0;i<[touches count];i++){
        CGPoint p = [[[touches allObjects] objectAtIndex:i] locationInView:self];
        if(p.x<0 || p.y <0 || p.x>self.frame.size.width || p.y>self.frame.size.height){
            inside = NO;
            break;
        }
    }
    
    if(inside && self.delegate != nil && [self.delegate respondsToSelector:self.didTouch]){
        [self.delegate performSelectorOnMainThread:self.didTouch withObject:self waitUntilDone:NO];
    }


}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{

    if(isChangeAlpha) {
        self.alpha = 1;
    } 
}

- (void)dealloc
{
    _delegate = nil;
    _didTouch = nil;
}

@end
