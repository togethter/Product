//
//  BusinessCardAdapterProtocol.h
//  Product
//
//  Created by 李学良 on 2018/10/24.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol BusinessCardAdapterProtocol <NSObject>

- (NSString *)name;
- (UIColor *)lineColor;
- (NSString *)phoneNumber;

@end

