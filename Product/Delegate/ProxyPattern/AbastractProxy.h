//
//  AbastractProxy.h
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AbastractProxy : NSProxy


@property (nonatomic, weak) id delegate;
@end

NS_ASSUME_NONNULL_END
