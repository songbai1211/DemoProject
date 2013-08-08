//
//  MMPlayLayerView.h
//  DemoProject
//
//  Created by name on 13-8-5.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVPlayerLayer;

@interface MMPlayLayerView : UIView

@property (nonatomic, readonly)AVPlayerLayer *playerLayer;

- (void)setVideoFillMode:(NSString *)fillMode;

@end
