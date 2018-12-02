//
//  BusinessCardView.h
//  Product
//
//  Created by 李学良 on 2018/10/24.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessCardAdapterProtocol.h"
#define  BUSINESS_FRAME  CGRectMake(0, 0, 200, 130)

@interface BusinessCardView : UIView

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) UIColor *lineColor;

@property (nonatomic, strong) NSString *phoneNumber;


/**
 加载数据（实现了BusinessCardAdapterProtocol 协议的数据）

 @param data 实现了BusinessCardAdapterProtocol协议的数据
 */
- (void)loadData:(id<BusinessCardAdapterProtocol>)data;



@end

