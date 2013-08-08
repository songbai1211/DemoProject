//
//  MMPlayLayerView.m
//  DemoProject
//
//  Created by name on 13-8-5.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "MMPlayLayerView.h"
#import <AVFoundation/AVFoundation.h>

@implementation MMPlayLayerView


+ (Class)layerClass
{
	return [AVPlayerLayer class];
}

- (AVPlayerLayer *)playerLayer
{
	return (AVPlayerLayer *)self.layer;
}

- (void)setPlayer:(AVPlayer*)player
{
	[(AVPlayerLayer*)[self layer] setPlayer:player];
}

//Specifies how the video is displayed within a player layer’s bounds.
//(AVLayerVideoGravityResizeAspect is default)
- (void)setVideoFillMode:(NSString *)fillMode
{
	AVPlayerLayer *playerLayer = (AVPlayerLayer*)[self layer];
	playerLayer.videoGravity = fillMode;
}

-(void)set90{
    self.frame  = CGRectMake(0, 0 , 480 ,320);
    self.bounds = self.frame;
    self.center = CGPointMake(160, 240);
    
    CGAffineTransform landscapeTransform;
    landscapeTransform = CGAffineTransformMakeRotation(90 * M_PI / 180);
    [self setTransform:landscapeTransform];
}


@end
