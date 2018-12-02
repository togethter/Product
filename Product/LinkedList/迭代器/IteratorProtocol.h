//
//  IteratorProtocol.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IteratorProtocol <NSObject>


@required

/**
 下一个对象

 @return 对象
 */
- (id)nextObject;

@end

NS_ASSUME_NONNULL_END
