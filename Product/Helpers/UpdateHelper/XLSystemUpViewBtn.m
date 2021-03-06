////
////  XLSystemUpViewBtn.m
////  chongfa
////
////  Created by bilin on 2017/8/18.
////  Copyright © 2017年 Bilin-Apple. All rights reserved.
////
//
#import "XLSystemUpViewBtn.h"

@interface XLSystemUpViewBtn ()<UITableViewDelegate,UITableViewDataSource>
//@property (nonatomic, strong) UITableView *tableView;
//// 立即更新
//@property (nonatomic, strong) UIButton *immediateUpdatebtn;
//// 暂不更新
//@property (nonatomic, strong) UIButton *temporarilyBtn;
//
//
//
@end
@implementation XLSystemUpViewBtn
//
//- (UIButton *)immediateUpdatebtn
//{
//    if (!_immediateUpdatebtn) {
//        _immediateUpdatebtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_immediateUpdatebtn setTitleColor:RGBCOLOR(255, 255, 255) forState:UIControlStateNormal];
//        _immediateUpdatebtn.titleLabel.font = [UIFont fontWithName:FontName size:14];
//        [_immediateUpdatebtn addTarget:self action:@selector(updateAction:) forControlEvents:UIControlEventTouchUpInside];
//        _immediateUpdatebtn.backgroundColor = RGBCOLOR(0, 177, 255);
//        [_immediateUpdatebtn setTitle:@"去更新" forState:UIControlStateNormal];
//        _immediateUpdatebtn.adjustsImageWhenHighlighted = NO;
//
//    }
//    return _immediateUpdatebtn;
//}
//
//- (UIButton *)temporarilyBtn
//{
//    if (!_temporarilyBtn) {
//        _temporarilyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_temporarilyBtn setImage:[UIImage imageNamed:@"closed_big"] forState:UIControlStateNormal];
//        [_temporarilyBtn addTarget:self action:@selector(temporarilyAction:) forControlEvents:UIControlEventTouchUpInside];
//
//
//    }
//    return _temporarilyBtn;
//}
//// 立即更新
//- (void)updateAction:(UIButton *)sender
//{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(XLsystemUpAction)]) {
//        [self.delegate XLsystemUpAction];// 升级
//    }
//}
//
//// 暂不更新
//- (void)temporarilyAction:(UIButton *)sender
//{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(XLSystemUpViewBtnDissmis:)]) {
//        [self.delegate XLSystemUpViewBtnDissmis:self];// 移除自身
//    }
//}
///*
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}
//*/
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if (self.dataArray.count >=2) {// 大于等于2的话
//        return self.dataArray.count - 1;
//    }
//    return self.dataArray.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
//    }
//    NSString *text = nil;
//    if (self.dataArray.count >=2 && (self.dataArray.count - 1) > indexPath.row) {
//        text = self.dataArray[indexPath.row];
//    } else {
//        text = self.dataArray[indexPath.row];
//    }
//    cell.textLabel.text = text;
//    cell.textLabel.font = [UIFont fontWithName:FontName size:12];
//    cell.textLabel.numberOfLines = 0;
//    cell.textLabel.textColor = RGBCOLOR(51, 51, 51);
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return cell;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString *text = nil;
//    if (self.dataArray.count >=2 && (self.dataArray.count - 1) > indexPath.row) {
//        text = self.dataArray[indexPath.row];
//    } else {
//        text = self.dataArray[indexPath.row];
//    }
//    CGFloat ziW =  (310 * XLh  - (28 * 2));
//    CGFloat rowH = [NSString setSelfH:text withSize:CGSizeMake(ziW, MAXFLOAT) withDic:@{NSFontAttributeName:[UIFont fontWithName:FontName size:12]}];
//    return rowH;
//}
//- (UITableView *)tableView
//{
//    if (_tableView == nil) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.tableFooterView = [UIView new];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        if (iOS11) {
//            _tableView.estimatedRowHeight = 0;
//            _tableView.estimatedSectionHeaderHeight = 0;
//            _tableView.estimatedSectionFooterHeight = 0;
//        }
//    }
//    return _tableView;
//}
//
//- (instancetype)initWithXLsystemUpViewWithDelegate:(id<XLSystemUpViewBtnDelegate>)delegate
//{
//    XLSystemUpViewBtn *btn = [[[self class] alloc] initWithFrame:CGRectZero];
//    btn.layer.cornerRadius = 10;
//    btn.layer.masksToBounds = YES;
//    btn.delegate = delegate;
//    return btn;
//}
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor whiteColor];
//        UILabel *updateTip = [UILabel new];
//        updateTip.textAlignment = NSTextAlignmentCenter;
//        updateTip.text = @"更新提示";
//        updateTip.font = [UIFont fontWithName:FontName size:18];
//        updateTip.textColor = RGBCOLOR(51, 51, 51);
//        [self addSubview:updateTip];
//        [self addSubview:self.tableView];
//        [self addSubview:self.temporarilyBtn];// 暂不更新
//        [self addSubview:self.immediateUpdatebtn];// 立即更新
//        [updateTip mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.mas_top).offset(14);
//            make.centerX.mas_equalTo(self.mas_centerX);
//            make.width.mas_equalTo(100);
//            make.height.mas_equalTo(18);
//        }];
//
//        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(updateTip.mas_bottom).offset(20 * XLV);
//            make.left.mas_equalTo(self.mas_left).offset(28);
//            make.right.mas_equalTo(self.mas_right).offset(-28);
//            make.bottom.mas_equalTo(self.immediateUpdatebtn.mas_top).offset(-16 * XLV);
//        }];
//
//        [self.temporarilyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.mas_top);
//            make.height.mas_equalTo(37);
//            make.width.mas_equalTo(37);
//            make.right.mas_equalTo(self.mas_right);
//        }];
//
//        [self.immediateUpdatebtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(self.mas_bottom);
//            make.left.mas_equalTo(self.mas_left);
//            make.height.mas_equalTo(37);
//            make.right.mas_equalTo(self.mas_right);
//        }];
//
//    }
//    return self;
//}
//
//- (void)temporarilyBtnuserInteractionEnabled:(BOOL)userInteractionEnabled
//{
//    self.temporarilyBtn.userInteractionEnabled = userInteractionEnabled;
//    self.temporarilyBtn.hidden = !userInteractionEnabled;
//
//
//}
@end
