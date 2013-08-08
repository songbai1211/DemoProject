//
//  AudioRecord.m
//  DemoProject
//
//  Created by apple on 13-8-3.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "AudioRecord.h"
#import "lame.h"

@interface AudioRecord ()

- (long) getFileSize:(NSString*) path;
- (void)recordUpdate;

@end

@implementation AudioRecord

@synthesize delegate;
@synthesize sampleRate;
@synthesize audioFormat;
@synthesize quality;
@synthesize isRecording;
@synthesize recordFile;


- (id)init
{
    self = [super init];
    if (self != nil) {
        
        self.sampleRate     = 44100;
        self.quality        = AVAudioQualityMedium;
        self.audioFormat    = kAudioFormatMPEG4AAC;
        
        self.isRecording    = NO;
        self.recordFile     = nil;
        
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];

    }
    return self;
}


- (BOOL)startRecord:(NSString *)fileName
{
    if (!self.isRecording) {
        
        NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithFloat:self.sampleRate],       AVSampleRateKey,
                                  [NSNumber numberWithInt: self.audioFormat],       AVFormatIDKey,
                                  [NSNumber numberWithInt: 2],                      AVNumberOfChannelsKey,
                                  [NSNumber numberWithInt: self.quality],           AVEncoderAudioQualityKey,
                                  nil];
        
        self.recordFile = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:fileName]];
        NSError *err;
        audioRecorder = [[AVAudioRecorder alloc] initWithURL:self.recordFile settings:settings error:&err];
        
        if (err)
        {
            NSLog(@"%@", [err description]);
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                            message:@"your device doesn't support your setting"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
            return NO;
        }
        
        self.isRecording = YES;
        [audioRecorder prepareToRecord];
        audioRecorder.meteringEnabled = YES;
        [audioRecorder record];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:.01f
                                                 target:self
                                               selector:@selector(recordUpdate)
                                               userInfo:nil
                                                repeats:YES];
        return YES;
        
    } else {
        
        //正在录音，直接返回YES
        return YES;
    }
}


- (void)finishRecord
{
    //停止录音
    self.isRecording = NO;
    
    if (audioRecorder) {
        [audioRecorder stop];
        audioRecorder = nil;
    }
}

- (void)cancelRecord
{
    //停止录音
    self.isRecording = NO;
    
    if (audioRecorder) {
        [audioRecorder stop];
        audioRecorder = nil;
    }
    
    //删除文件
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:[self.recordFile absoluteString]];
    if (isExist) {
        [[NSFileManager defaultManager] removeItemAtURL:self.recordFile error:nil];
    }

}


- (void)EncodePCMFile:(NSString *)pcmFile
            ToMP3File:(NSString *)mp3File
         successBlock:(void (^)())success
          failedBlock:(void (^)(NSException *exception))failed

{
    NSString *cafFilePath =[NSTemporaryDirectory() stringByAppendingString:pcmFile];
    
    NSString *mp3FileName = [mp3File stringByAppendingString:@".mp3"];
    NSString *mp3FilePath = [[NSHomeDirectory() stringByAppendingFormat:@"/Documents/"] stringByAppendingPathComponent:mp3FileName];
    
    FILE *pcm = NULL;
    FILE *mp3 = NULL;
    lame_t lame = NULL;
    
    @try {
        int read, write;
        pcm = fopen([cafFilePath cStringUsingEncoding:1], "rb");    //source
        fseek(pcm, 4*1024, SEEK_CUR);                               //skip file header
        mp3 = fopen([mp3FilePath cStringUsingEncoding:1], "wb");    //output
        
        const int PCM_SIZE = 8192;
        const int MP3_SIZE = 8192;
        short int pcm_buffer[PCM_SIZE*2];
        unsigned char mp3_buffer[MP3_SIZE];
        
        lame = lame_init();
        lame_set_in_samplerate(lame, self.sampleRate);
        lame_set_VBR(lame, vbr_default);
        lame_init_params(lame);
        
        do {
            read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            if (read == 0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            fwrite(mp3_buffer, write, 1, mp3);
            
        } while (read != 0);

        success();
    }
    @catch (NSException *exception) {
        failed(exception);
        return;
    }
    @finally {
        
        if (lame) {
           lame_close(lame);
        }
        
        if (mp3) {
            fclose(mp3);
        }

        if (pcm) {
            fclose(pcm);
        }
    

    }
}




#pragma mark private

- (long) getFileSize:(NSString*) path
{
    NSFileManager * filemanager = [[NSFileManager alloc]init];
    if([filemanager fileExistsAtPath:path]){
        NSDictionary * attributes = [filemanager attributesOfItemAtPath:path error:nil];
        NSNumber *theFileSize;
        if((theFileSize = [attributes objectForKey:NSFileSize]))
            return  [theFileSize longValue];
        else
            return -1;
    } else {
        return -1;
    }
}

- (void)recordUpdate
{
    if (self.isRecording) {
        
        long curDuration = (long)audioRecorder.currentTime * 100;                       //精确到毫秒
        long fileSize =  [self getFileSize:[self.recordFile absoluteString]];           //单位为字节
        
        if ([self.delegate respondsToSelector:@selector(recordProgressFileSize:curDuration:)]) {
            [self.delegate recordProgressFileSize:fileSize curDuration:curDuration];
        }
    }
}



@end








