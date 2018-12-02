//
//  UIPickerView+XLExtension.h
//  Product
//
//  Created by 李学良 on 2018/10/19.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIPickerView (XLExtension)

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id<UIPickerViewDelegate>)delegate
                   dataSource:(id<UIPickerViewDataSource>)dataSource;

@end

