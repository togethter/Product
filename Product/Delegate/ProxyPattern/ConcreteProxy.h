//
//  ConcreteProxy.h
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "AbastractProxy.h"

#import "MessageProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface ConcreteProxy : AbastractProxy<MessageProtocol>


@end

NS_ASSUME_NONNULL_END
