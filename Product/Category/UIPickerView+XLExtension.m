//
//  UIPickerView+XLExtension.m
//  Product
//
//  Created by 李学良 on 2018/10/19.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "UIPickerView+XLExtension.h"

@implementation UIPickerView (XLExtension)
- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id<UIPickerViewDelegate>)delegate
                   dataSource:(id<UIPickerViewDataSource>)dataSource
{
    
    if (self = [super initWithFrame:frame]) {
        self.delegate   = delegate;
        self.dataSource = dataSource;
    }
    return self;
}
@end
