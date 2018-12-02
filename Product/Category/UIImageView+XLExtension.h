//
//  UIImageView+XLExtension.h
//  Button
//
//  Created by xl on 2018/10/19.
//

#import <UIKit/UIKit.h>


@interface UIImageView (XLExtension)

@property (nonatomic, copy,readonly) void (^imageBlock)(UIImageView *sender);

/**
 图片

 @param frame frame
 @param imageName 图片的名字
 @return 大小
 */
-(UIImageView *)initWithFrame:(CGRect)frame
                    imageName:(NSString *)imageName;


/**
 初始化图片

 @param frame frame
 @param imageName 图片名字
 @param cornerRadius 圆角大小
 @return 图片
 */
- (UIImageView *)initWithFrame:(CGRect)frame
                     imageName:(NSString *)imageName
                  cornerRadius:(CGFloat)cornerRadius;





/**
 初始化图片

 @param frame frame
 @param imageName 图片name
 @param cornerRadius 大于0 削圆角 小于等于0不削圆角
 @param imageBlock 图片的点击回调
 @return 图片对象
 */
- (UIImageView *)initWithFrame:(CGRect)frame
                     imageName:(NSString *)imageName
                  cornerRadius:(CGFloat)cornerRadius
                    imageBlock:(void(^)(UIImageView * sender))imageBlock;


/**
 削圆角
 
 @param cornerRadius 大小
 */
- (void)cornerRadius:(CGFloat)cornerRadius;

/**
 设置图片的borderWidth ,图片的borderColor
 @param borderWidth borderWidth
 @param borderColor borderColor
 */
- (void)borderWidth:(CGFloat)borderWidth
        borderColor:(UIColor *)borderColor;
/**
 图片的点击事件

 @param imageBlock 回调
 */
- (void)imageBlock:(void(^)(UIImageView *sender))imageBlock;



@end

