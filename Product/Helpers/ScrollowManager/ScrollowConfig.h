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
/**中间的间距*/
@property (nonatomic, assign) CGFloat margin;
/** 最左右边的间距*/
@property (nonatomic, assign) CGFloat leftRightMargin;
/** 标题的高度*/
@property (nonatomic, assign) CGFloat titleScrollowH;
/** 没有选中的颜色*/
@property (nonatomic, strong) UIColor *normalTitleColor;
/**topViweBackgroundColor*/
@property (nonatomic, strong) UIColor *topViweBackgroundColor;
/** 选中的颜色*/
@property (nonatomic, strong) UIColor *selctTitleColor;
/** 下划线的颜色*/
@property (nonatomic, strong) UIColor *_lineViewColor;
/** 下划线距离下面的间距*/
@property (nonatomic, assign) CGFloat _lineView_bottom;
/** 正常字体*/
@property (nonatomic, strong) UIFont *normalFont;
/** 选中的字体*/
@property (nonatomic, strong) UIFont *selectFont;
/** 下划线的宽度*/
@property (nonatomic, assign) CGFloat lineViewWidth;
/** 下滑线的高度*/
@property (nonatomic, assign) CGFloat lineViewHeight;
/** 选择第几个控制器*/
@property (nonatomic, assign) NSInteger choiceIndex;
@end

NS_ASSUME_NONNULL_END
