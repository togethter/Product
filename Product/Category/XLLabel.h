//
//  XLLabel.h
//  XLKit
//
//  Created by xinshijie on 17/3/22.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger , XLLabelStyle){
    XLLabelStyleNone = 0,
    XLLabelStyleUser = 1,
    XLLabelStyleTopic = 2,
    XLLabelStyleLink = 3,
    XLLabelStyleAgreement = 4,
    XLLabelStyleUserDefine = 5,
    XLLabelStylePhoneNumber = 6
};

@class XLLabel ;

@protocol XLLabelDelegate <NSObject>

@optional

// 代理
-(void)XLLabel:(XLLabel *)label didSelectedString:(NSString *)selectedString forXLLabelStyle:(XLLabelStyle *)style onRange:(NSRange)range ;

@end

//Block
typedef void(^TapXLLabel)(UILabel *,XLLabelStyle, NSString * , NSRange);

@interface XLLabel : UILabel

/* 普通文字颜色 */
@property(nonatomic , strong)UIColor *XLLabelNormalColor ;

/* 选中时高亮背景色 */
@property(nonatomic , strong)UIColor *XLLabelHightLightBackgroundColor ;

/* 字符串+显示颜色 字典数组, */
@property(nonatomic, strong)NSArray<NSDictionary *> *XLLabelMatchArr;

/* 高亮文字设置颜色*/
-(void)setHightLightLabelColor:(UIColor *)hightLightColor forXLLabelStyle:(XLLabelStyle)XLLabelStyle;

/* delegate */
@property(nonatomic, weak)id<XLLabelDelegate> delegate;


/* 点击事件block */
@property(nonatomic, strong)TapXLLabel XLTapOperation;


@end
