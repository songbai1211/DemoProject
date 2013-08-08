//
//  UIFactory.h
//
//  Created by zzc on 12-3-30.
//  Copyright (c) 2012年 Twin-Fish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFactory : NSObject

+ (UIFactory*)sharedUIFactory;

/**--------------------------------
 * Create UITextField
 *
 * frame            :CGRect
 * delegate         :id<UITextFieldDelegate>
 * returnKeyType    :UIReturnKeyType
 * secureTextEntry  :BOOL
 * placeholder      :NSString
 * font             :UIFont
 *
 */
+ (id)createTextFieldWith:(CGRect)frame 
                 delegate:(id<UITextFieldDelegate>)delegate
            returnKeyType:(UIReturnKeyType)returnKeyType
          secureTextEntry:(BOOL)secureTextEntry
              placeholder:(NSString *)placeholder 
                     font:(UIFont *)font;


+ (id)createTextFieldWithRect:(CGRect)frame
                 keyboardType:(UIKeyboardType)keyboardType
                       secure:(BOOL)secure
                  placeholder:(NSString *)placeholder
                         font:(UIFont *)font
                        color:(UIColor *)color
                     delegate:(id)delegate;

/**--------------------------------
 * Create UILabel
 *
 * frame :CGRect
 * label :NSString
 *
 */
+ (id)createLabelWith:(CGRect)frame 
                 text:(NSString *)text;


/**--------------------------------
 * Create UILabel
 *
 * frame            :CGRect
 * label            :NSString
 * backgroundColor  :UIColor
 *
 */
+ (id)createLabelWith:(CGRect)frame 
                 text:(NSString *)text 
      backgroundColor:(UIColor *)backgroundColor;


+ (id)createLabelWith:(CGRect)frame
                 text:(NSString *)text
                 font:(UIFont *)font
            textColor:(UIColor *)textColor;

/**--------------------------------
 * Create UILabel
 *
 * frame            :CGRect
 * label            :NSString
 * font             :UIFont
 * textColor        :UIColor
 * backgroundColor  :UIColor
 *
 */
+ (id)createLabelWith:(CGRect)frame 
                 text:(NSString *)text 
                 font:(UIFont *)font 
            textColor:(UIColor *)textColor 
      backgroundColor:(UIColor *)backgroundColor;


/**--------------------------------
 * Create UILabel
 *
 * originPoint      :CGPoint
 * text             :NSString
 * font             :UIFont
 * textColor        :UIColor
 * backgroundColor  :UIColor
 *
 */
+ (id)createLabelWithOrigin:(CGPoint)originPoint
                       text:(NSString *)text 
                       font:(UIFont *)font 
                  textColor:(UIColor *)textColor 
            backgroundColor:(UIColor *)backgroundColor;

/**--------------------------------
 * Convert Resizable (Stretchable) Image;
 *
 *  title           :NSString *
 *  message         :NSString *
 */
+ (UIImage*)resizableImageWithSize:(CGSize)size
                             image:(NSString*)image;


+ (UIButton *)createButtonWithRect:(CGRect)frame
                            normal:(NSString *)normalImage
                         highlight:(NSString *)clickIamge
                          selector:(SEL)selector
                            target:(id)target;

+ (UIButton *)createButtonWithRect:(CGRect)frame 
                             title:(NSString *)title
                         titleFont:(UIFont *)font
                        titleColor:(UIColor *)titleColor
                            normal:(NSString *)normalImage
                          selected:(NSString *)clickIamge
                          selector:(SEL)selector
                            target:(id)target;

+ (UIButton *)createButtonWithRect:(CGRect)frame 
                             title:(NSString *)title
                         titleFont:(UIFont *)font
                        titleColor:(UIColor *)titleColor
                            normal:(NSString *)normalImage
                         highlight:(NSString *)clickIamge
                          selector:(SEL)selector
                            target:(id)target;

+ (UIButton *)createButtonWithRect:(CGRect)frame 
                             title:(NSString *)title
                         titleFont:(UIFont *)font
                        titleColor:(UIColor *)titleColor
                            normal:(NSString *)normalImage
                         highlight:(NSString *)clickIamge
                             fixed:(CGSize)fixedSize
                          selector:(SEL)selector
                            target:(id)target;

+ (UIButton *)createButtonWithRect:(CGRect)frame 
                             title:(NSString *)title
                         titleFont:(UIFont *)font
                        titleColor:(UIColor *)titleColor
                            normal:(NSString *)normalImage
                         highlight:(NSString *)clickIamge
                          selected:(NSString *)selectedImage
                          selector:(SEL)selector
                            target:(id)target;

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
                            target:(id)target;

+ (id)createImageViewWithRect:(CGRect)frame
                        image:(NSString *)image;






+ (NSString *)localized:(NSString *)key;

+ (void)showAlert:(NSString *)message;
+ (void)showAlert:(NSString *)message tag:(NSUInteger)tag delegate:(id)delegate;
+ (void)showConfirm:(NSString *)message tag:(NSUInteger)tag delegate:(id)delegate;

/**--------------------------------
 * Check Network Address Validation
 */
+ (BOOL)isValidIPAddress:(NSString *)address;
+ (BOOL)isValidPortAddress:(NSString *)address;


+ (float)getSystemVersion;
+ (void)showAppStoreCommentWithAppID:(int)appID;

//获得中文gbk编码
+(NSStringEncoding)getGBKEncoding;

////AES加密
//+ (NSData *)useAES256Encrypt:(NSString *)plainText;
////AES解密
//+ (NSString *)useAES256Decrypt:(NSData *)cipherData;






@end





