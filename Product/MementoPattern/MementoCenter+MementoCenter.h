//
//  MementoCenter+MementoCenter.h
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "MementoCenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface MementoCenter (MementoCenter)

/**
 存储状态

 @param key 键值
 */
- (void)saveStateWithKey:(NSString *)key;

/**
 恢复状态

 @param key 键值
 */
- (void)recoverFromStateWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
