//
//  YEngine.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractEngine.h"
#import "BuilderProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface YEngine : NSObject<AbstractEngine,BuilderProtocol>

@end

NS_ASSUME_NONNULL_END
