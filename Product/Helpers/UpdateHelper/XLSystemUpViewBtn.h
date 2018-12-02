//
//  XLSystemUpViewBtn.h
//  chongfa
//
//  Created by bilin on 2017/8/18.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLSystemUpViewBtn;
@protocol XLSystemUpViewBtnDelegate <NSObject>

@required
/** 系统升级*/
- (void)XLsystemUpAction;
/** 移除自身*/
- (void)XLSystemUpViewBtnDissmis:(XLSystemUpViewBtn *)view;

@end
@interface XLSystemUpViewBtn : UIView
@property (nonatomic, weak) id<XLSystemUpViewBtnDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *dataArray;

- (instancetype)initWithXLsystemUpViewWithDelegate:(id<XLSystemUpViewBtnDelegate>)delegate;
// 暂不更新的用户交互状态
// userInteractionEnabled == YES 的话用户交互打开
// userInteractionEnabled == NO 的话用户交互关闭
- (void)temporarilyBtnuserInteractionEnabled:(BOOL)userInteractionEnabled;


@end
