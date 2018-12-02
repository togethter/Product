//
//  Customer.h
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Customer;

@protocol CustomerDelegate <NSObject>

@required
- (void)customer:(Customer *)customer buyItemCount:(NSInteger)count;

@end
@interface Customer : NSObject

// 经销商
@property (nonatomic, weak) id<CustomerDelegate>delegate;

// 顾客买卖行为
- (void)buyItemCount:(NSInteger)count;
@end

