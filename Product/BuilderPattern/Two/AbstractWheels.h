//
//  AbstractWheels.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol AbstractWheels <NSObject>


/**
 轮子的数目

 @param number 数目
 */
- (void)wheelsNumber:(NSNumber *)number;

/**
 信息

 @return 引擎信息
 */
- (NSString *)infomation;
@end

NS_ASSUME_NONNULL_END
