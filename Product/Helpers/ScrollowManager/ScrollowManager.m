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

- (void)addChilders:(NSArray *)childerViewControllerArray titles:(NSArray *)titleArray {
    for (int i = 0; i < childerViewControllerArray.count; i++) {
        [self addChilder:childerViewControllerArray[i] title:titleArray[i]];
    }
}
+ (instancetype)scrollManagerWithContentView:(UIView *)contentView withParentController:(UIViewController *)parentViewController  withConfi:(nonnull ScrollowConfig *)config{
    ScrollowManager *view = [[ScrollowManager alloc] initWithFrame:contentView.frame];
    [contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(contentView);
    }];
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

- (instancetype (^)(UIView *contentView ,UIViewController *parentViewController, ScrollowConfig *config))parentViewController {
    return ^ScrollowManager * (UIView *contentView,UIViewController *parentViewController, ScrollowConfig *config) {
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
            self.titleArray = [NSMutableArray array];
        }
        [self.titleArray addObject:title];

        return self;
    };
}

- (void)show {
    
    // 创建TitleScrollowView
    [self titleScrollowView];
    // 创建contentScrollowView
    [self contentScrollowView];
    self.titleScrollow.showsVerticalScrollIndicator = NO;
    self.titleScrollow.showsHorizontalScrollIndicator = NO;
    self.contentScrollow.showsVerticalScrollIndicator = NO;
    self.contentScrollow.showsHorizontalScrollIndicator = NO;
    
}

// 创建titleScrollow
- (void)titleScrollowView {
    CGFloat totoalBtnContentWidth = 0;
    UIScrollView *scrollow = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), self.confi.titleScrollowH)];
    scrollow.bounces  = NO;
    self.titleScrollow = scrollow;
    UIButton *oldBtn = nil;
    UIButton *newBtn = nil;
    for (int i = 0; i < self.titleArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:self.confi.normalTitleColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(senderBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 1000 + i;
        btn.titleLabel.font = (self.confi.choiceIndex == i)? self.confi.selectFont : self.confi.normalFont;
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
    self.oldBtn.titleLabel.font = self.confi.selectFont;
    lineView.frame = CGRectMake(0, self.confi.titleScrollowH - self.confi._lineView_bottom,
                                self.confi.lineViewWidth, self.confi.lineViewHeight);
    CGPoint point = lineView.center;
    point.x = btn.center.x;
    lineView.center = point;
    [scrollow addSubview:lineView];
    self.lineView = lineView;
    scrollow.delegate = self;
    totoalBtnContentWidth = CGRectGetMaxX(((UIButton *)self.oldBtnArray.lastObject).frame) + self.confi.leftRightMargin;
    scrollow.contentSize = CGSizeMake(totoalBtnContentWidth , 0);
    [self addSubview:self.titleScrollow];
    if (self.confi.topViweBackgroundColor) {
        self.titleScrollow.backgroundColor = self.confi.topViweBackgroundColor;
    }
}
// 创建contentScrollow
- (void)contentScrollowView {
    UIScrollView *contentScrollow = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleScrollow.frame), CGRectGetWidth(self.contentView.frame),CGRectGetHeight(self.contentView.frame) - self.confi.titleScrollowH)];
    contentScrollow.bounces = NO;
    self.contentScrollow = contentScrollow;
    [self addSubview:contentScrollow];
    [contentScrollow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleScrollow.mas_bottom);
        make.left.right.bottom.mas_equalTo(self);
    }];
    UIView *view = [[UIView alloc] init];
    [contentScrollow addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(contentScrollow);
        make.width.mas_equalTo(contentScrollow).multipliedBy(self.parentVC.childViewControllers.count);
        make.height.mas_equalTo(contentScrollow);
    }];
    if (self.confi.choiceIndex == 0) {
        UIViewController *vc = self.parentVC.childViewControllers.firstObject;
        vc.view.frame = CGRectMake(0, 0, CGRectGetWidth(contentScrollow.frame), CGRectGetHeight(self.contentScrollow.frame) - self.confi.titleScrollowH);
        [contentScrollow addSubview:vc.view];
        [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentScrollow.mas_top);
            make.left.mas_equalTo(self.contentScrollow.mas_left);
            make.width.mas_equalTo(CGRectGetWidth(contentScrollow.frame));
            make.bottom.mas_equalTo(self.contentScrollow.mas_bottom);
        }];
    }
    self.contentScrollow.contentSize = CGSizeMake(self.parentVC.childViewControllers.count *  1.0f *CGRectGetWidth(contentScrollow.frame), 0);
    contentScrollow.delegate = self;
    contentScrollow.pagingEnabled = YES;
    [contentScrollow setContentOffset:CGPointMake(CGRectGetWidth(contentScrollow.frame) * self.confi.choiceIndex, 0) animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // any offset changes
    if (![scrollView isEqual:self.contentScrollow]) return;
    CGFloat offset = scrollView.contentOffset.x;
    NSInteger index =  offset / CGRectGetWidth(self.contentScrollow.frame);
    CGFloat  rare = offset / CGRectGetWidth(self.contentScrollow.frame) - index;
    if (self.oldAndNewBtnDistance.count  == index && self.oldBtnArray.count >index ) {
        UIButton *btn = self.oldBtnArray[index];
        CGFloat width = [self.oldAndNewBtnDistance[index - 1] floatValue] * rare;
        CGPoint center = btn.center;
        __weak typeof(self)weakSelf = self;
        CGPoint lineViewcenter = self.lineView.center;
        lineViewcenter.x = center.x + width;
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.lineView.center = lineViewcenter;
        }];
        return;
    }
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
- (void)buttonSizeFit:(NSArray *)buttonArray {
    for (UIButton *button in buttonArray) {
        CGFloat h = button.height;
        CGFloat centerX = button.centerX;
        [button sizeToFit];
        CGFloat w = button.width;
        button.centerX = centerX;
        button.height = h;
        button.width = w;
    }
}

- (void)senderBtn:(UIButton *)sender {
    NSInteger index = sender.tag - 1000;
    [self.contentScrollow setContentOffset:CGPointMake(index *CGRectGetWidth(self.contentScrollow.frame), 0) animated:NO];
    if (self.parentVC.childViewControllers.count < index)return;
    UIViewController *vc = self.parentVC.childViewControllers[index];
    if (![self.contentScrollow.subviews containsObject:vc.view]) {
        vc.view.frame = CGRectMake(index * CGRectGetWidth(self.contentScrollow.frame), 0, CGRectGetWidth(self.contentScrollow.frame),  CGRectGetHeight(self.contentScrollow.frame));
        [self.contentScrollow addSubview:vc.view];
        [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentScrollow.mas_left).offset(index * CGRectGetWidth(self.contentScrollow.frame));
            make.top.mas_equalTo(self.contentScrollow.mas_top);
            make.width.mas_equalTo(CGRectGetWidth(self.contentScrollow.frame));
            make.bottom.mas_equalTo(self.contentScrollow.mas_bottom);
        }];
    }
    if (self.oldBtn != sender) {
        [self.oldBtn setTitleColor:self.confi.normalTitleColor forState:UIControlStateNormal];
        self.oldBtn.titleLabel.font = self.confi.normalFont;
        [sender setTitleColor:self.confi.selctTitleColor forState:UIControlStateNormal];
        sender.titleLabel.font = self.confi.selectFont;
        [self buttonSizeFit:@[sender,self.oldBtn]];
        [self changCenter:sender];
    } else {
        [self.oldBtn setTitleColor:self.confi.selctTitleColor forState:UIControlStateNormal];
        self.oldBtn.titleLabel.font = self.confi.selectFont;
        [self buttonSizeFit:@[self.oldBtn]];
    }
    CGPoint lineViewCenter = self.lineView.center;
    lineViewCenter.x  = sender.center.x;
    __weak typeof(self)weakself = self;
    [UIView animateWithDuration:0.25 animations:^{
        weakself.lineView.center = lineViewCenter;
    }];
    self.oldBtn = sender;
    
}


- (void)findControllerWithScrollow:(UIScrollView *)scrollow {
    if (![self.contentScrollow isEqual:scrollow]) return;
    NSInteger index =  scrollow.contentOffset.x / CGRectGetWidth(self.contentView.frame);
    if (self.parentVC.childViewControllers.count <= index) return;
    UIViewController *vc = self.parentVC.childViewControllers[index];
    NSInteger oldIndex = [self.oldBtnArray indexOfObject:self.oldBtn];
    if (oldIndex != index) {
        [self.oldBtn setTitleColor:self.confi.normalTitleColor forState:UIControlStateNormal];
        self.oldBtn.titleLabel.font = self.confi.normalFont;
        UIButton *newBtn = self.oldBtnArray[index];
        [newBtn setTitleColor:self.confi.selctTitleColor forState:UIControlStateNormal];
        newBtn.titleLabel.font = self.confi.selectFont;
        [self buttonSizeFit:@[newBtn,self.oldBtn]];
        [self changCenter:newBtn];
    } else {
        [self.oldBtn setTitleColor:self.confi.selctTitleColor forState:UIControlStateNormal];
        self.oldBtn.titleLabel.font = self.confi.selectFont;
        [self buttonSizeFit:@[self.oldBtn]];
    }
    if (![self.contentScrollow.subviews containsObject:vc.view]) {
        vc.view.frame = CGRectMake(index * CGRectGetWidth(self.contentScrollow.frame), 0, CGRectGetWidth(self.contentScrollow.frame),  CGRectGetHeight(self.contentScrollow.frame));
        [self.contentScrollow addSubview:vc.view];
        
        [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(index * CGRectGetWidth(self.contentScrollow.frame));
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(CGRectGetWidth(self.contentScrollow.frame));
            make.bottom.mas_equalTo(self.contentScrollow.mas_bottom);
        }];
    }
        self.oldBtn = self.oldBtnArray[index];
}


- (void)changCenter:(UIButton *)sender {
    CGFloat offset = sender.center.x - CGRectGetWidth(self.contentView.frame) * 0.5;
    // 如果在屏幕中心的左边
    if (offset < 0) {
        // 不做偏移
        offset = 0;
    }
    // 标签ScrollView的偏移量打到最右时
    CGFloat maxOffset = self.titleScrollow.contentSize.width - CGRectGetWidth(self.contentView.frame);
    // 如果这个偏移量大于最大
    if (offset > maxOffset && maxOffset >0) {
        // 设置为最大
        offset = maxOffset;
    }
    if (maxOffset < 0) {
        offset = 0;
    }
    [self.titleScrollow setContentOffset:CGPointMake(offset, 0) animated:YES];
    
}

- (void)scrowIndex:(NSInteger)scrowIndex {
    [self.contentScrollow setContentOffset:CGPointMake(CGRectGetWidth(self.contentScrollow.frame) * scrowIndex, 0) animated:YES];

}
- (void)dealloc {
    DLog(@"%@",NSStringFromClass(self.class));
}
@end
