//
//  ScrollowConfig.h
//  Product
//
//  Created by 李学良 on 2018/12/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollowConfig : NSObject
@property (nonatomic, assign) CGFloat margin;// 中间的间距
@property (nonatomic, assign) CGFloat leftRightMargin;// 最左右边的间距
@property (nonatomic, assign) CGFloat titleScrollowH;// 标题的高度
@property (nonatomic, strong) UIColor *normalTitleColor;// 没有选中的颜色
@property (nonatomic, strong) UIColor *selctTitleColor;// 选中的颜色
@property (nonatomic, strong) UIColor *_lineViewColor;// 下划线的颜色
@property (nonatomic, assign) CGFloat _lineView_bottom;// 下划线距离下面的间距
@property (nonatomic, strong) UIFont *font;// 字体的大小

@end

NS_ASSUME_NONNULL_END
