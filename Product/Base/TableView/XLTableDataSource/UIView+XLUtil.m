//
//  UIView+XLUtil.m
//  XLTableDataSourceDemo
//
//  Created by eHome on 17/2/17.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "UIView+XLUtil.h"

@implementation UIView (XLUtil)

+ (instancetype)viewFromXib
{
    Class viewClass = [self class];
    NSString *viewClassName = NSStringFromClass(viewClass);
    NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:viewClassName owner:nil options:nil];
    
    for (id nibItem in nibArray) {
        if ([nibItem isMemberOfClass:viewClass]) {
            return nibItem;
        }
    }
    
    return nil;
}

@end
