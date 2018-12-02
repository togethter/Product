//
//  UIDatePicker+XLExtension.m
//  Product
//
//  Created by 李学良 on 2018/10/19.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "UIDatePicker+XLExtension.h"
#import <objc/runtime.h>
@implementation UIDatePicker (XLExtension)

static char DateBlockKey;

- (void)setDatePickerBlock:(void (^)(UIDatePicker *))datePickerBlock
{
    objc_setAssociatedObject(self, &DateBlockKey, datePickerBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UIDatePicker *))datePickerBlock
{
   return  objc_getAssociatedObject(self, &DateBlockKey);
}

- (instancetype)initWithFrame:(CGRect)frame
                       locale:(NSLocale *)locale
              datePickerModel:(UIDatePickerMode)datePickerModel
               minuteInterval:(NSInteger)minuteInterval
                      minDate:(NSDate *)minDate
                      maxDate:(NSDate *)maxDate
              datePickerBlock:(void (^)(UIDatePicker *))datePickerBlock
{
    if (self = [self initWithFrame:frame]) {
        self.locale = locale;
        self.datePickerMode = datePickerModel;
        self.minuteInterval = minuteInterval;
        self.minimumDate = minDate;
        self.maximumDate = maxDate;
        self.datePickerBlock = datePickerBlock;
        [self addTarget:self action:@selector(datePickerChange:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}


- (void)datePickerChange:(UIDatePicker *)datePicker
{
    if (self.datePickerBlock) {
        self.datePickerBlock(datePicker);
    }
}
@end
