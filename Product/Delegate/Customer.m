//
//  Customer.m
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (void)buyItemCount:(NSInteger)count {
    if (self.delegate && [self.delegate respondsToSelector:@selector(customer:buyItemCount:)]) {
        [self.delegate customer:self buyItemCount:count];
    }
}
@end
