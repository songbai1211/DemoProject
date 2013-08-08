//
//  AudioRecord.h
//  DemoProject
//
//  Created by apple on 13-8-3.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppMacros.h"
#import <AVFoundation/AVFoundation.h>

@protocol AudioRecordDelegate <NSObject>

-(void)recordProgressFileSize:(long)size curDuration:(long)ss;

@end


@interface AudioRecord : NSObject
{
    AVAudioRecorder *audioRecorder;
    NSTimer*        timer;
}

@property(nonatomic, assign)id<AudioRecordDelegate> delegate;
@property(nonatomic, assign)CGFloat         sampleRate;
@property(nonatomic, assign)NSInteger       audioFormat;
@property(nonatomic, assign)AVAudioQuality  quality;
@property(nonatomic, assign)BOOL            isRecording;
@property(nonatomic, assign)NSURL           *recordFile;


- (BOOL)startRecord:(NSString *)fileName;

- (void)finishRecord;

- (void)cancelRecord;

- (void)EncodePCMFile:(NSString *)pcmFile
            ToMP3File:(NSString *)mp3File
         successBlock:(void (^)())success
          failedBlock:(void (^)(NSException *exception))failed;


@end






/***********************************************************
sampleRate取值: 
44100.0  或11025.0
 
audioFormat取值:
 enum
 {
 kAudioFormatLinearPCM               = 'lpcm',
 kAudioFormatAC3                     = 'ac-3',
 kAudioFormat60958AC3                = 'cac3',
 kAudioFormatAppleIMA4               = 'ima4',
 kAudioFormatMPEG4AAC                = 'aac ',
 kAudioFormatMPEG4CELP               = 'celp',
 kAudioFormatMPEG4HVXC               = 'hvxc',
 kAudioFormatMPEG4TwinVQ             = 'twvq',
 kAudioFormatMACE3                   = 'MAC3',
 kAudioFormatMACE6                   = 'MAC6',
 kAudioFormatULaw                    = 'ulaw',
 kAudioFormatALaw                    = 'alaw',
 kAudioFormatQDesign                 = 'QDMC',
 kAudioFormatQDesign2                = 'QDM2',
 kAudioFormatQUALCOMM                = 'Qclp',
 kAudioFormatMPEGLayer1              = '.mp1',
 kAudioFormatMPEGLayer2              = '.mp2',
 kAudioFormatMPEGLayer3              = '.mp3',
 kAudioFormatTimeCode                = 'time',
 kAudioFormatMIDIStream              = 'midi',
 kAudioFormatParameterValueStream    = 'apvs',
 kAudioFormatAppleLossless           = 'alac',
 kAudioFormatMPEG4AAC_HE             = 'aach',
 kAudioFormatMPEG4AAC_LD             = 'aacl',
 kAudioFormatMPEG4AAC_ELD            = 'aace',
 kAudioFormatMPEG4AAC_ELD_SBR        = 'aacf',
 kAudioFormatMPEG4AAC_ELD_V2         = 'aacg',
 kAudioFormatMPEG4AAC_HE_V2          = 'aacp',
 kAudioFormatMPEG4AAC_Spatial        = 'aacs',
 kAudioFormatAMR                     = 'samr',
 kAudioFormatAudible                 = 'AUDB',
 kAudioFormatiLBC                    = 'ilbc',
 kAudioFormatDVIIntelIMA             = 0x6D730011,
 kAudioFormatMicrosoftGSM            = 0x6D730031,
 kAudioFormatAES3                    = 'aes3'
 };
 
 
quality取值:
 enum {
 AVAudioQualityMin = 0,
 AVAudioQualityLow = 0x20,
 AVAudioQualityMedium = 0x40,
 AVAudioQualityHigh = 0x60,
 AVAudioQualityMax = 0x7F
 };
 typedef NSInteger AVAudioQuality;
 
 **********************************************************/





