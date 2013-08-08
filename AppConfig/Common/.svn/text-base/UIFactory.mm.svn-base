//
//  UIFactory.m
//
//  Created by zzc on 12-3-30.
//  Copyright (c) 2012年 Twin-Fish. All rights reserved.
//

#import "UIFactory.h"
#import "AppConfig.h"
#import <arpa/inet.h>
#import <sys/sysctl.h>
#import <AudioToolbox/AudioToolbox.h>
#import <SSToolkit/SSToolkit.h>
#import <SSToolkit/SSCategories.h>

static UIFactory* factory;

@implementation UIFactory

+ (UIFactory*)sharedUIFactory{
    
    if(factory == nil)
        factory = [[UIFactory alloc]init];
    return factory;
}

#pragma mark - Create TextField

+ (id)createTextFieldWith:(CGRect)frame 
                 delegate:(id<UITextFieldDelegate>)delegate
            returnKeyType:(UIReturnKeyType)returnKeyType
          secureTextEntry:(BOOL)secureTextEntry
              placeholder:(NSString *)placeholder 
                     font:(UIFont *)font {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    if (delegate != nil) {
        textField.delegate = delegate;
        textField.returnKeyType = returnKeyType;
        textField.secureTextEntry = secureTextEntry;
        textField.placeholder = placeholder;
        textField.font = font;
        
        // Default property
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.enablesReturnKeyAutomatically = YES;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
    }
    return textField;
}



+ (UITextField *)createTextFieldWithRect:(CGRect)frame
                            keyboardType:(UIKeyboardType)keyboardType
                                  secure:(BOOL)secure
                             placeholder:(NSString *)placeholder
                                    font:(UIFont *)font
                                   color:(UIColor *)color
                                delegate:(id)delegate
{
    UITextField *textField = [UIFactory createTextFieldWith:frame
                                                   delegate:delegate
                                              returnKeyType:UIReturnKeyNext
                                            secureTextEntry:secure
                                                placeholder:placeholder
                                                       font:font];
    
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.keyboardType = keyboardType;
    if (color != nil)
        [textField setTextColor:color];
    
    return textField;
}

#pragma mark - Create Lable

+ (id)createLabelWith:(CGRect)frame text:(NSString *)text {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    return label;
}

+ (id)createLabelWith:(CGRect)frame 
                 text:(NSString *)text 
      backgroundColor:(UIColor *)backgroundColor {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.backgroundColor = backgroundColor;
    return label;
}

+ (id)createLabelWith:(CGRect)frame
                 text:(NSString *)text
                 font:(UIFont *)font
            textColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.backgroundColor = [UIColor clearColor];
    return label;
}


+ (id)createLabelWith:(CGRect)frame 
                text:(NSString *)text 
                 font:(UIFont *)font 
            textColor:(UIColor *)textColor 
      backgroundColor:(UIColor *)backgroundColor {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.backgroundColor = backgroundColor;
    return label;
}


+ (id)createLabelWithOrigin:(CGPoint)originPoint
                       text:(NSString *)text 
                       font:(UIFont *)font 
                  textColor:(UIColor *)textColor 
            backgroundColor:(UIColor *)backgroundColor {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.frame.origin = originPoint;
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.backgroundColor = backgroundColor;
    [label sizeToFit];
    
    return label;
}



#pragma mark - Create Button

+ (UIImage*)resizableImageWithSize:(CGSize)size
                             image:(NSString*)imageName
{
    UIImage *image = nil;
    if (imageName == nil) {
        return nil;
    } else {
        image = [UIImage imageNamedNoCache:imageName];
    }

    if ([image respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
        
        /**
         - (UIImage *)resizableImageCapInsets:(UIEdgeInsets)Insets
         其中Insets这个参数的格式是(top,left,bottom,right)，从上、左、下、右分别在图片上画了一道线，
         这样就给一个图片指定了一个矩形区域。只有在框里面的部分才会被拉伸，而框外面的部分则保持改变。
         */
        return [image resizableImageWithCapInsets:UIEdgeInsetsMake(size.height, size.width, size.height, size.width)];
    } else {
        
        /**
         - (UIImage *)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight
         这个函数是UIImage的一个实例函数，它的功能是创建一个内容可拉伸，而边角不拉伸的图片，需要两个参数，第一个是不拉伸区域距离左边框的宽度，
         第二个参数是不拉伸区域距离上边框的高度，其操作本质是对一个像素的复制拉伸，故没有渐变效果，这也是其缺点所在。
         注意：只是对一个点像素进行复制到指定的宽度。
         */
        return [image stretchableImageWithLeftCapWidth:size.width topCapHeight:size.height];
    }
}

+ (UIButton *)createButtonWithRect:(CGRect)frame 
                             title:(NSString *)title
                         titleFont:(UIFont *)font
                        titleColor:(UIColor *)titleColor
                            normal:(NSString *)normalImage
                          selected:(NSString *)clickImage
                          selector:(SEL)selector
                            target:(id)target
{    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (title != nil)
        [button setTitle:title forState:UIControlStateNormal];
    
    if (titleColor != nil)
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (font != nil)
        [button.titleLabel setFont:font];
    
    if (normalImage != nil)
        [button setBackgroundImage:[UIImage imageNamedNoCache:normalImage] forState:UIControlStateNormal];
    
    if (clickImage != nil)
        [button setBackgroundImage:[UIImage imageNamedNoCache:clickImage] forState:UIControlStateSelected];
    
    if ((selector != nil) && (target != nil))
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


+ (UIButton *)createButtonWithRect:(CGRect)frame
                            normal:(NSString *)normalImage
                         highlight:(NSString *)clickIamge
                          selector:(SEL)selector
                            target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    if (normalImage != nil)
        [button setBackgroundImage:[UIImage imageNamedNoCache:normalImage] forState:UIControlStateNormal];
    
    if (clickIamge != nil)
        [button setBackgroundImage:[UIImage imageNamedNoCache:clickIamge] forState:UIControlStateHighlighted];
    
    if ((selector != nil) && (target != nil))
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIButton *)createButtonWithRect:(CGRect)frame 
                             title:(NSString *)title
                         titleFont:(UIFont *)font
                        titleColor:(UIColor *)titleColor
                            normal:(NSString *)normalImage
                         highlight:(NSString *)clickIamge
                          selector:(SEL)selector
                            target:(id)target
{    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (title != nil)
        [button setTitle:title forState:UIControlStateNormal];
    
    if (titleColor != nil)
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (font != nil)
        [button.titleLabel setFont:font];
    
    if (normalImage != nil)
        [button setBackgroundImage:[UIImage imageNamedNoCache:normalImage] forState:UIControlStateNormal];
    
    if (clickIamge != nil)
        [button setBackgroundImage:[UIImage imageNamedNoCache:clickIamge] forState:UIControlStateHighlighted];
    
    if ((selector != nil) && (target != nil))
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


+ (UIButton *)createButtonWithRect:(CGRect)frame 
                             title:(NSString *)title
                         titleFont:(UIFont *)font
                        titleColor:(UIColor *)titleColor
                            normal:(NSString *)normalImage
                         highlight:(NSString *)clickIamge
                             fixed:(CGSize)fixedSize
                          selector:(SEL)selector
                            target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    if (title != nil)
        [button setTitle:title forState:UIControlStateNormal];
    
    if (titleColor != nil)
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (font != nil)
        [button.titleLabel setFont:font];
    
    if (normalImage != nil) {
        [button setBackgroundImage:[UIFactory resizableImageWithSize:fixedSize image:normalImage]
                          forState:UIControlStateNormal];
    }
    
    if (clickIamge != nil) {
        [button setBackgroundImage:[UIFactory resizableImageWithSize:fixedSize image:clickIamge]
                          forState:UIControlStateHighlighted];
    }
    
    if ((selector != nil) && (target != nil))
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIButton *)createButtonWithRect:(CGRect)frame 
                             title:(NSString *)title
                         titleFont:(UIFont *)font
                        titleColor:(UIColor *)titleColor
                            normal:(NSString *)normalImage
                         highlight:(NSString *)clickIamge
                          selected:(NSString *)selectedImage
                          selector:(SEL)selector
                            target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    if (title != nil)
        [button setTitle:title forState:UIControlStateNormal];
    
    if (titleColor != nil)
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (font != nil)
        [button.titleLabel setFont:font];
    
    if (normalImage != nil)
        [button setBackgroundImage:[UIImage imageNamedNoCache:normalImage] forState:UIControlStateNormal];
    
    if (clickIamge != nil)
        [button setBackgroundImage:[UIImage imageNamedNoCache:clickIamge] forState:UIControlStateHighlighted];
    
    if (selectedImage != nil)
        [button setBackgroundImage:[UIImage imageNamedNoCache:selectedImage] forState:UIControlStateSelected];
    
    if ((selector != nil) && (target != nil))
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchDown];
    
    return button;
    
}


+ (UIButton *)createButtonWithRect:(CGRect)frame
                             title:(NSString *)title
                         titleFont:(UIFont  *)font
                  titleColorNormal:(UIColor *)titleColorNormal
               titleColorHighLight:(UIColor *)titleColorHighLight
                       normalImage:(NSString *)normalImage
                    highlightImage:(NSString *)highlightImage
             backgroundImageNormal:(NSString *)backgroundImageNormal
          backgroundImageHighLight:(NSString *)backgroundImageHighLight
                          selector:(SEL)selector
                            target:(id)target
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    if (title != nil) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    if (font != nil) {
        [button.titleLabel setFont:font];
    }
    
    if (titleColorNormal != nil) {
        [button setTitleColor:titleColorNormal forState:UIControlStateNormal];
    }
    
    if (titleColorHighLight != nil) {
        [button setTitleColor:titleColorHighLight forState:UIControlStateHighlighted];
    }
    
    if (normalImage != nil) {
        [button setImage:[UIImage imageNamedNoCache:normalImage] forState:UIControlStateNormal];
    }
    
    if (highlightImage != nil) {
        [button setImage:[UIImage imageNamedNoCache:highlightImage] forState:UIControlStateHighlighted];
    }
    
    if (backgroundImageNormal != nil) {
        [button setBackgroundImage:[UIImage imageNamedNoCache:backgroundImageNormal] forState:UIControlStateNormal];
    }
    
    if (backgroundImageHighLight != nil) {
        [button setBackgroundImage:[UIImage imageNamedNoCache:backgroundImageHighLight] forState:UIControlStateHighlighted];
    }
    
    if (selector != nil) {
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}


+ (id)createImageViewWithRect:(CGRect)frame
                        image:(NSString *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamedNoCache:image];
    return imageView;
}

#pragma mark - localized

+ (NSString *)localized:(NSString *)key
{
    NSString *langCode      = @"";
    NSString *appLanguage   = [[NSUserDefaults standardUserDefaults] stringForKey:kDefaultLanguageKey];
    
    if ([appLanguage isEqualToString:kLanguage_English] == YES) {
        langCode = @"en";
    } else if ([appLanguage isEqualToString:kLanguage_SimpleChinese] == YES) {
        langCode = @"zh-Hans";
    } else {
        langCode = @"zh-Hans";
    }
    NSString *path           = [[NSBundle mainBundle] pathForResource:langCode ofType:@"lproj"];
    NSBundle *languageBundle = [NSBundle bundleWithPath:path];
    return [languageBundle localizedStringForKey:key value:@"" table:nil];
}

#pragma mark - Check IP/Port

+ (BOOL)isValidIPAddress:(NSString *)address
{
    if ([address length] < 1)
        return NO;
    
    struct in_addr addr;
    return (inet_aton([address UTF8String], &addr) == 1);
}

+ (BOOL)isValidPortAddress:(NSString *)address
{
    return [UIFactory checkIntValueRange:address min:1 max:65535];
}

+ (BOOL)checkIntValueRange:(NSString *)value min:(int)min max:(int)max
{
    if ([value length] < 1)
        return NO;
    
    NSScanner * scanner = [NSScanner scannerWithString:value];
    if ([scanner scanInt:nil] && [scanner isAtEnd]) {
        NSLog(@"min = %u, max = %u, value = %u %@", min, max, [value integerValue], value);
        return (min <= [value integerValue]) && ([value integerValue] <= max);
    }
    
    return NO;

}


#pragma mark - Show Alert
+ (void)showAlert:(NSString *)message
{
    UIAlertView *view =  [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:[UIFactory localized:@"Ok"]
                                          otherButtonTitles:nil];
    [view show];
}

+ (void)showAlert:(NSString *)message tag:(NSUInteger)tag delegate:(id)delegate
{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@""
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:[UIFactory localized:@"Ok"]
                                          otherButtonTitles:nil];
    view.tag = tag;
    [view show];
}

+ (void)showConfirm:(NSString *)message tag:(NSUInteger)tag delegate:(id)delegate
{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@""
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:[UIFactory localized:@"Cancel"]
                                          otherButtonTitles:[UIFactory localized:@"Ok"], nil];
    view.tag = tag;
    [view show];
}



+(void)invokeVibration
{
    //TODO: 振动调用
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}

+(float)getSystemVersion
{
    //TODO: 获得系统版本
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}


+(NSString *)getDeviceTokenFromData:(NSData *)deviceToken
{
    
    //获取APNS设备令牌
    
    NSMutableString * deviceTokenStr = [NSMutableString stringWithFormat:@"%@",deviceToken];
    NSRange allRang;
    allRang.location    = 0;
    allRang.length      = deviceTokenStr.length;
    
    [deviceTokenStr replaceOccurrencesOfString:@" " withString:@"" options:NULL range:allRang];
    
    NSRange begin   = [deviceTokenStr rangeOfString:@"<"];
    NSRange end     = [deviceTokenStr rangeOfString:@">"];
    
    NSRange deviceRange;
    deviceRange.location    = begin.location + 1;
    deviceRange.length      = end.location - begin.location -1;
    
    return [deviceTokenStr substringWithRange:deviceRange];
}

+(void)showAppStoreCommentWithAppID:(int)appID
{
    //TODO: 显示AppStore应用评论
    NSString *str = [NSString stringWithFormat:
                     @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d",
                     appID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

+(NSStringEncoding)getGBKEncoding
{
    
    //获得中文gbk编码
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return enc;
}

#pragma mark --加密解密

#define kAES256DefaultKey      @"abcdefghijklmnopqrst"
////加密
//+ (NSData *)useAES256Encrypt:(NSString *)plainText
//{
//    NSData *res = nil;
//    if (plainText) {
//        NSData *plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
//        res = [plainData AES256EncryptWithKey:kAES256DefaultKey];
//    }
//    return res;
//}
//
////解密
//+ (NSString *)useAES256Decrypt:(NSData *)cipherData
//{
//    NSString *res = nil;
//    if ((cipherData != nil) && ([cipherData length] > 0)) {
//        NSData *plainData = [cipherData AES256DecryptWithKey:kAES256DefaultKey];
//        res = [[NSString alloc] initWithData:plainData encoding:NSUTF8StringEncoding];
//    }
//    return res;
//}

@end