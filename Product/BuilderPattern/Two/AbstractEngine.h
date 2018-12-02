//
//  AbstractEngine.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AbstractEngine <NSObject>

/**
 引擎的尺寸

 @param scale 尺寸
 */
- (void)engineScale:(CGFloat)scale;

/**
 引擎的重量

 @param kg 重量
 */
- (void)engineWeight:(CGFloat)kg;

/**
 信息

 @return 引擎信息
 */
- (NSString *)infomation;

@end

NS_ASSUME_NONNULL_END
