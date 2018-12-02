//
//  BuilderProtocol.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BuilderProtocol <NSObject>

@required


/**
 构建对象

 @return 返回构建的对象
 */
- (id)build;

@end

NS_ASSUME_NONNULL_END
