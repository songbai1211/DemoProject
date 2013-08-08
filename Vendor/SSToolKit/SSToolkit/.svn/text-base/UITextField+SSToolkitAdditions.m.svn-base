//
//  UITextField+SSToolkitAdditions.m
//  SSToolkit
//
//  Created by apple on 13-8-6.
//  Copyright (c) 2013年 Sam Soffes. All rights reserved.
//

#import "UITextField+SSToolkitAdditions.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@implementation UITextField (SSToolkitAdditions)

static NSString *kTextMaxLengthKey = @"kTextMaxLengthKey";

- (void)setTextMaxLength:(int)length
{
    objc_setAssociatedObject(self, (__bridge const void *)(kTextMaxLengthKey), [NSNumber numberWithInt:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(textFieldTextMaxLengthLimit:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldTextMaxLengthLimit:(id)sender
{
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kTextMaxLengthKey));
    NSUInteger length = [lengthNumber integerValue];
    if(self.text.length > length){
        self.text = [self.text substringToIndex:length];
    }
}

@end
