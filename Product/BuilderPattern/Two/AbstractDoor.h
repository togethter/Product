//
//  AbstractDoor.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol AbstractDoor <NSObject>


/**
 门的颜色

 @param color 颜色
 */
- (void)doorColor:(UIColor *)color;

/**
 信息

 @return 引擎的信息
 */
- (NSString *)infomation;

@end

NS_ASSUME_NONNULL_END
