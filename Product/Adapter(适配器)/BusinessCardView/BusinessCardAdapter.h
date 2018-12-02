//
//  BusinessCardAdapter.h
//  Product
//
//  Created by 李学良 on 2018/10/24.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusinessCardAdapterProtocol.h"
#import <UIKit/UIKit.h>

@interface BusinessCardAdapter : NSObject<BusinessCardAdapterProtocol>

@property (nonatomic, weak) id data;


- (instancetype)initWithData:(id)data;
@end

