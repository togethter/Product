//
//  ScrollowManager.m
//  Product
//
//  Created by 李学良 on 2018/11/29.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "ScrollowManager.h"
#import "ScrollowConfig.h"
@interface ScrollowManager ()<UIScrollViewDelegate>

@property (nonatomic, weak)     UIViewController *parentVC;
@property (nonatomic, strong)     NSMutableArray *titleArray;
@property (nonatomic, weak)               UIView *contentView;
@property (nonatomic, strong)       UIScrollView *titleScrollow;
@property (nonatomic, strong)       UIScrollView *contentScrollow;
@property (nonatomic, strong)     NSMutableArray *oldBtnArray;
@property (nonatomic, strong)     NSMutableArray *oldAndNewBtnDistance;
@property (nonatomic, strong)             UIView *lineView;
@property (nonatomic, strong)             ScrollowConfig *confi;
@property (nonatomic, strong) UIButton *oldBtn;
@end
@implementation ScrollowManager

- (NSMutableArray *)oldAndNewBtnDistance {
    if (!_oldAndNewBtnDistance) {
        _oldAndNewBtnDistance = [NSMutableArray array];
    }
    return _oldAndNewBtnDistance;
}
- (NSMutableArray *)oldBtnArray {
    if (!_oldBtnArray) {
        _oldBtnArray = [NSMutableArray array];
    }
    return _oldBtnArray;
}


+ (instancetype)scrollManagerWithContentView:(UIView *)contentView withParentController:(UIViewController *)parentViewController  withConfi:(nonnull ScrollowConfig *)config{
    ScrollowManager *view = [[ScrollowManager alloc] initWithFrame:contentView.frame];
    [contentView addSubview:view];
    view.confi = config;
    view.contentView = contentView;
    view.parentVC = parentViewController;
    return view;
}
- (void)addChilder:(UIViewController *)childerViewController title:(NSString *)title {
    [self.parentVC addChildViewController:childerViewController];
    if (self.titleArray == nil) {
        self.titleArray = [NSMutableArray array];
    }
    [self.titleArray addObject:title];
    
}

- (instancetype (^)(UIView *contentView ,UIViewController *parentViewController))parentViewController; {
    return ^ScrollowManager * (UIView *contentView,UIViewController *parentViewController) {
        ScrollowManager *view = [[ScrollowManager alloc] initWithFrame:contentView.bounds];
        [contentView addSubview:view];
        view.parentVC = parentViewController;
        view.contentView = contentView;
        return view;
    };
}
- (instancetype (^)(UIViewController *vc, NSString *title))addChildren {
    return ^ScrollowManager *(UIViewController *vc,NSString *title) {
        [self.parentVC addChildViewController:vc];
        if (!self.titleArray) {
            [self.titleArray addObject:title];
        }
        return self;
    };
}

- (void)show {
    
    // 创建TitleScrollowView
    [self titleScrollowView];
    // 创建contentScrollowView
    [self contentScrollowView];
    
}

// 创建titleScrollow
- (void)titleScrollowView {
    CGFloat totoalBtnContentWidth = 0;
    UIScrollView *scrollow = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), self.confi.titleScrollowH)];
    scrollow.bounces  = NO;
    self.titleScrollow = scrollow;
    static UIButton *oldBtn = nil;
    UIButton *newBtn = nil;
    for (int i = 0; i < self.titleArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:self.confi.normalTitleColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(senderBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 1000 + i;
        btn.titleLabel.font = self.confi.font;
        [btn sizeToFit];
        CGFloat const btnW = btn.frame.size.width;
        UIButton *lastBtn = self.oldBtnArray.lastObject;// 最后一个btn
        
        btn.frame = CGRectMake(lastBtn?(CGRectGetMaxX(lastBtn.frame) + self.confi.margin):(self.confi.leftRightMargin) , 0, btnW, self.confi.titleScrollowH);
        [scrollow addSubview:btn];
        if (oldBtn == nil && newBtn == nil) {
            oldBtn = btn;
            [self.oldBtnArray addObject:btn];
        } else if (newBtn == nil) {
            UIButton *oldbtn =  self.oldBtnArray.lastObject;
            CGFloat width = (CGRectGetWidth(btn.frame) + CGRectGetWidth(oldbtn.frame)) / 2 + CGRectGetMinX(btn.frame) - CGRectGetMaxX(oldbtn.frame);
            [self.oldAndNewBtnDistance addObject:@(width)];
            oldBtn = btn;
            [self.oldBtnArray addObject:oldBtn];
        }
    
        
    }
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = self.confi._lineViewColor;
    UIButton *btn = self.oldBtnArray.firstObject;
    self.oldBtn = btn;
    [self.oldBtn setTitleColor:self.confi.selctTitleColor forState:UIControlStateNormal];
    CGFloat oldBtnW = CGRectGetWidth(btn.frame);
    lineView.frame = CGRectMake(0, self.confi.titleScrollowH - self.confi._lineView_bottom, oldBtnW * 0.4, 2);
    CGPoint point = lineView.center;
    point.x = btn.center.x;
    lineView.center = point;
    [scrollow addSubview:lineView];
    self.lineView = lineView;
    scrollow.delegate = self;
    totoalBtnContentWidth = CGRectGetMaxX(((UIButton *)self.oldBtnArray.lastObject).frame) + self.confi.leftRightMargin;
    scrollow.contentSize = CGSizeMake(totoalBtnContentWidth , 0);
    [self addSubview:self.titleScrollow];
}
// 创建contentScrollow
- (void)contentScrollowView {
    UIScrollView *contentScrollow = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleScrollow.frame), CGRectGetWidth(self.contentView.frame),CGRectGetHeight(self.contentView.frame) - self.confi.titleScrollowH)];
    contentScrollow.bounces = NO;
    self.contentScrollow = contentScrollow;
    UIViewController *vc = self.parentVC.childViewControllers.firstObject;
    vc.view.frame = CGRectMake(0, 0, CGRectGetWidth(contentScrollow.frame), CGRectGetHeight(self.contentScrollow.frame) - self.confi.titleScrollowH);
    [contentScrollow addSubview:vc.view];
    self.contentScrollow.contentSize = CGSizeMake(self.parentVC.childViewControllers.count *  1.0f *CGRectGetWidth(contentScrollow.frame), 0);
    contentScrollow.delegate = self;
    contentScrollow.pagingEnabled = YES;
    [self addSubview:contentScrollow];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // any offset changes
    if (![scrollView isEqual:self.contentScrollow]) return;
    CGFloat offset = scrollView.contentOffset.x;
    NSInteger index =  offset / CGRectGetWidth(self.contentScrollow.frame);
    CGFloat  rare = offset / CGRectGetWidth(self.contentScrollow.frame) - index;
    if (self.oldBtnArray.count >index && self.oldAndNewBtnDistance.count > index) {
        UIButton *btn = self.oldBtnArray[index];
        CGFloat width = [self.oldAndNewBtnDistance[index] floatValue] * rare;
        CGPoint center = btn.center;
        __weak typeof(self)weakSelf = self;
        CGPoint lineViewcenter = self.lineView.center;
        lineViewcenter.x = center.x + width;
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.lineView.center = lineViewcenter;
        }];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
   [self findControllerWithScrollow:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self findControllerWithScrollow:scrollView];
}
- (void)senderBtn:(UIButton *)sender {
    NSInteger index = sender.tag - 1000;
    [self.contentScrollow setContentOffset:CGPointMake(index *CGRectGetWidth(self.contentScrollow.frame), 0) animated:YES];
}


- (void)findControllerWithScrollow:(UIScrollView *)scrollow {
    if (![self.contentScrollow isEqual:scrollow]) return;
    NSInteger index =  scrollow.contentOffset.x / CGRectGetWidth(self.contentView.frame);
    if (self.parentVC.childViewControllers.count <= index) return;
    UIViewController *vc = self.parentVC.childViewControllers[index];
    NSInteger oldIndex = [self.oldBtnArray indexOfObject:self.oldBtn];
    if (oldIndex != index) {
        [self.oldBtn setTitleColor:self.confi.normalTitleColor forState:UIControlStateNormal];
        UIButton *newBtn = self.oldBtnArray[index];
        [newBtn setTitleColor:self.confi.selctTitleColor forState:UIControlStateNormal];
    } else {
        [self.oldBtn setTitleColor:self.confi.selctTitleColor forState:UIControlStateNormal];
    }
    if (![self.contentScrollow.subviews containsObject:vc.view]) {
        vc.view.frame = CGRectMake(index * CGRectGetWidth(self.contentScrollow.frame), 0, CGRectGetWidth(self.contentScrollow.frame),  CGRectGetHeight(self.contentScrollow.frame));
        [self.contentScrollow addSubview:vc.view];
    }
    [self convernFrameWithScrollow:scrollow];
    self.oldBtn = self.oldBtnArray[index];
}


- (void)convernFrameWithScrollow:(UIScrollView *)scrollow {

    
    
    
}
@end
