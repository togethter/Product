//
//  UIImageView+XLExtension.m
//  Button
//
//  Created by xl on 2018/10/19.
//

#import "UIImageView+XLExtension.h"
#import <objc/runtime.h>

@implementation UIImageView (XLExtension)
-(UIImageView *)initWithFrame:(CGRect)frame
                    imageName:(NSString *)imageName;
{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:imageName];
        self.userInteractionEnabled = YES;
    }
    return self;
}


- (UIImageView *)initWithFrame:(CGRect)frame
                     imageName:(NSString *)imageName
                  cornerRadius:(CGFloat)cornerRadius
{
    UIImageView *imageView = [self initWithFrame:frame imageName:imageName];
    [imageView cornerRadius:cornerRadius];
    return imageView;
}


- (UIImageView *)initWithFrame:(CGRect)frame
                     imageName:(NSString *)imageName
                  cornerRadius:(CGFloat)cornerRadius
                    imageBlock:(void(^)(UIImageView * sender))imageBlock
{
    UIImageView *imageView = [self initWithFrame:frame imageName:imageName cornerRadius:cornerRadius];
    [imageView imageBlock:imageBlock];
    return imageView;
}
- (void)cornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius     = cornerRadius;
    self.layer.masksToBounds    = YES;
}
- (void)borderWidth:(CGFloat)borderWidth
        borderColor:(UIColor *)borderColor
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}
static char imageBlockKey;
- (void)setImageBlock:(void (^)(UIImageView *))imageBlock
{
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
    [self addGestureRecognizer:tapGes];
    objc_setAssociatedObject(self, &imageBlockKey, imageBlock, OBJC_ASSOCIATION_COPY);
    
}
- (void (^)(UIImageView *))imageBlock
{
   return objc_getAssociatedObject(self, &imageBlockKey);
}

- (void)tapGes:(UITapGestureRecognizer *)tapGes
{
    if (self.imageBlock) {
        self.imageBlock(self);
    }
}
- (void)imageBlock:(void(^)(UIImageView *sender))imageBlock
{
    self.imageBlock = imageBlock;
}
@end
