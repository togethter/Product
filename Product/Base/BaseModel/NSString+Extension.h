//
//  NSString+Extension.h
//  Product
//
//  Created by is on 2019/4/19.
//  Copyright © 2019 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)
/**
 *  驼峰转下划线（loveYou -> love_you）
 */
- (NSString *)mj_underlineFromCamel;
/**
 *  下划线转驼峰（love_you -> loveYou）
 */
- (NSString *)mj_camelFromUnderline;
/**
 * 首字母变大写
 */
- (NSString *)mj_firstCharUpper;
/**
 * 首字母变小写
 */
- (NSString *)mj_firstCharLower;

- (BOOL)mj_isPureInt;

- (NSURL *)mj_url;
@end

NS_ASSUME_NONNULL_END
