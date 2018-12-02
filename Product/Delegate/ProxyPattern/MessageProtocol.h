//
//  MessageProtocol.h
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MessageProtocol <NSObject>


@optional
- (void)helloWorld;
- (void)goodBye;


@end

NS_ASSUME_NONNULL_END
