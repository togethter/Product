//
//  UIDatePicker+XLExtension.h
//  Product
//
//  Created by 李学良 on 2018/10/19.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDatePicker (XLExtension)

@property (nonatomic, copy) void(^datePickerBlock)(UIDatePicker *datePicker);
- (instancetype)initWithFrame:(CGRect)frame
                       locale:(NSLocale *)locale
              datePickerModel:(UIDatePickerMode)datePickerModel
               minuteInterval:(NSInteger)minuteInterval
                      minDate:(NSDate *)minDate
                      maxDate:(NSDate *)maxDate
              datePickerBlock:(void(^)(UIDatePicker *datePicker))datePickerBlock;


@end

