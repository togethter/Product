//
//  SystemUpViewBtn.h
//  OPEN
//
//  Created by bilin on 16/10/9.
//  Copyright © 2016年 lixueliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SystemUpViewBtn;
@protocol SystemUpViewBtnDelegate <NSObject>

@required
/** 系统升级*/
- (void)systemUpAction;
/** 移除自身*/
- (void)SystemUpViewBtnDissmis:(SystemUpViewBtn *)view;

@end
@interface SystemUpViewBtn : UIView

+ (instancetype)showSystemViewWithDelegate:(id<SystemUpViewBtnDelegate>)delegate;
/** 数据源想要显示的描述*/
@property (nonatomic, strong) NSMutableArray *dataArray;
/** 取消的点击事件*/
@property (nonatomic, assign) UIButton *deleteBtn;
/** 版本号*/
@property (nonatomic, copy) NSString *versionHaoStr;

@end
