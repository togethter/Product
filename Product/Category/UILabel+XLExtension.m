//
//  UILabel+XLExtension.m
//  Button
//
//  Created by xl on 2018/10/19.
//

#import "UILabel+XLExtension.h"

@implementation UILabel (XLExtension)

- (UILabel *)initWithFrame:(CGRect)frame
                      font:(CGFloat)font
             textAlignment:(NSTextAlignment)alignment
                 textColor:(UIColor *)textColor
                      text:(NSString *)text;
{
    UILabel *lable = [[UILabel alloc]init];
    lable.frame = frame;
    lable.font = [UIFont systemFontOfSize:font];
    lable.userInteractionEnabled = YES;
    lable.textAlignment = alignment;
    lable.textColor = textColor;
    lable.text = text;
    return lable;
    
}
@end
