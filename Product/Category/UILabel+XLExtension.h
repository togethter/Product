//
//  UILabel+XLExtension.h
//  Button
//
//  Created by xl on 2018/10/19.
//

#import <UIKit/UIKit.h>


@interface UILabel (XLExtension)

- (UILabel *)initWithFrame:(CGRect)frame
                      font:(CGFloat)font
             textAlignment:(NSTextAlignment)alignment
                 textColor:(UIColor *)textColor
                      text:(NSString *)text;
@end

