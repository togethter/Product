//
//  UIButton+LLExtension.h
//  LLButtonDemo
//
//  Created by kevin on 2017/2/17.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,LLButtonStyle) {
    LLButtonStyleTextOnly = 1, //只显示文字
    LLButtonStyleImgOnly,      //只显示图片
    LLButtonStyleTextLeft,     //文字在左，图片在右
    LLButtonStyleTextRight,    //文字在右，图片在左
    LLButtonStyleTextTop,      //文字在上，图片在下
    LLButtonStyleTextBottom    //文字在下，图片在上
};


@interface UIButton (XLExtension)
@property (nonatomic, copy,readonly) void (^buttonBlock)(UIButton *  sender);

/**
 设置button

 @param buttonType buttonType类型
 @param normalImage 正常图片
 @param highlightImage 高亮图片
 @param title title
 @param font 字体大小
 @param buttonBlock 回调
 @return button对象
 */
+ (UIButton *)buttonWithType:(UIButtonType)buttonType
                 normalImage:(UIImage *)normalImage
              highlightImage:(nullable UIImage *)highlightImage
                       title:(nullable NSString *)title
                        font:(CGFloat)font
                    fontName:(NSString *)fontName
                 buttonBlock:(void(^)(UIButton *_Nullable))buttonBlock;


/**
 设置button

 @param buttonType buttonType类型
 @param normalImage 正常图片
 @param highlightImage 高亮图片
 @param title title
 @param fontName 字体名称
 @param font 字体大小
 @param normalBackgroundImage 正常背景颜色
 @param highlightBackgroundImage 高亮的背景颜色
 @param buttonBlock 回调
 @return button对象
 */
+ (UIButton *)buttonWithType:(UIButtonType)buttonType
                 normalImage:(UIImage *)normalImage
              highlightImage:(UIImage *)highlightImage
                       title:(NSString *)title
                    fontName:(NSString *)fontName
                        font:(CGFloat)font
       normalBackgroundImage:(UIImage *)normalBackgroundImage
    highlightBackgroundImage:(UIImage *)highlightBackgroundImage
                 buttonBlock:(void (^)(UIButton * _Nullable))buttonBlock;


/**
 button的回调

 @param buttonBlock 回调
 @param forControlEvents 点击
 */
- (void)buttonBlock:(void (^)(UIButton *))buttonBlock forControlEvents:(UIControlEvents)forControlEvents;

/**
 button的回调

 @param buttonBlock 回调
 */
- (void)buttonBlock:(void(^)(UIButton *sender))buttonBlock;

//调用这个方法前，必须先设置好button的image和title/attributedtitle 要不然无法生效
- (void)layoutButtonWithEdgeInsetsStyle:(LLButtonStyle)style
                        imageTitleSpace:(CGFloat)space;
@end
