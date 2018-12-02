//
//  BusinessCardAdapter.m
//  Product
//
//  Created by 李学良 on 2018/10/24.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "BusinessCardAdapter.h"

@implementation BusinessCardAdapter

- (instancetype)initWithData:(id)data
{
    self = [super init];
    if (self) {
        self.data = data;
    }
    return self;
}

- (NSString *)name
{
    return nil;
}

- (UIColor *)lineColor {
    return nil;
}
- (NSString *)phoneNumber {
    return nil;
}

@end
