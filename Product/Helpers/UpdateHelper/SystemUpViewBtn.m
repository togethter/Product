//
////
////  SystemUpViewBtn.m
////  OPEN
////
////  Created by bilin on 16/10/9.
////  Copyright © 2016年 lixueliang. All rights reserved.
////
//
#import "SystemUpViewBtn.h"
//#import "Masonry.h"
//static NSString *cell = @"cell";
@interface SystemUpViewBtn ()<UITableViewDataSource, UITableViewDelegate>
//@property (nonatomic, assign) id<SystemUpViewBtnDelegate>uDelegate;
///** 系统升级的ImageView*/
//@property (nonatomic, assign) UIImageView *upImageView;
//
///** 升级的btn*/
//@property (nonatomic, assign) UIButton *upBtn;
//@property (nonatomic, assign) UILabel *l1;
//@property (nonatomic, assign) UILabel *l2;
//@property (nonatomic, assign) UILabel *l3;
//@property (nonatomic, strong) NSMutableArray *labelArray;
//@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, assign) UILabel *banbenLabel;
//
@end
@implementation SystemUpViewBtn
//
//- (UITableView *)tableView {
//    if (!_tableView) {
//       _tableView = [[UITableView alloc] init];
//        _tableView.dataSource = self;
//        _tableView.delegate = self;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    }
//    return _tableView;
//}
//
//- (void)setVersionHaoStr:(NSString *)versionHaoStr {
//    _versionHaoStr = versionHaoStr;
//    self.banbenLabel.text = versionHaoStr;
//}
//- (NSMutableArray *)dataArray {
//    if (!_dataArray) {
//        _dataArray = [NSMutableArray array];
//
//    }
//    return _dataArray;
//}
//
//- (void)removeAction:(UIButton *)btn
//{
//    if (self.uDelegate && [self.uDelegate respondsToSelector:@selector(SystemUpViewBtnDissmis:)]) {
//        [self.uDelegate SystemUpViewBtnDissmis:self];
//    }
//}
//
//
//
//- (void)upSystemAction:(UIButton *)btn
//{
//    if (self.uDelegate && [self.uDelegate respondsToSelector:@selector(systemUpAction)]) {
//        [self.uDelegate systemUpAction];
//    }
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.dataArray.count - 1;
//}
//
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (self.dataArray.count > indexPath.row) {
//        NSString *str = self.dataArray[indexPath.row];
//        return   [str boundingRectWithSize:self.tableView.frame.size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont fontWithName:FontName size:15]} context:nil].size.height;
//    } else {
//        return 44;
//    }
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    UITableViewCell *acell =  [tableView dequeueReusableCellWithIdentifier:cell];
//    if (acell == nil) {
//        acell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
//    }
//    if (self.dataArray.count > indexPath.row) {
//        acell.textLabel.text = self.dataArray[indexPath.row];
//        acell.textLabel.font = [UIFont fontWithName:FontName size:15];
//        acell.textLabel.textColor = RGBCOLOR(34, 34, 34);
//    }
//
//    acell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return acell;
//}
//
//+ (instancetype)showSystemViewWithDelegate:(id<SystemUpViewBtnDelegate>)delegate
//{
//    UIImageView *upImageView = [UIImageView new];
//    upImageView.userInteractionEnabled = YES;
//    upImageView.image = [UIImage imageNamed:@"updata"];
//    SystemUpViewBtn *systemView = [[self alloc] initWithFrame:CGRectMake(0, 0, upImageView.image.size.width, upImageView.image.size.height)];
//    systemView.center = KEYWINDOW.center;
//    systemView.uDelegate = delegate;
//    return  systemView;
//}
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        __weak typeof(self)weakSelf = self;
//        self.userInteractionEnabled = YES;
//        UIImageView *upImageView = [UIImageView new];
//        upImageView.userInteractionEnabled = YES;
//        upImageView.image = [UIImage imageNamed:@"updata"];
//
//        UIButton *upBtn = [[UIButton alloc] init];
//
//        upBtn.layer.borderWidth = 2;
//        upBtn.layer.masksToBounds = YES;
//        upBtn.layer.borderColor = RGBCOLOR(235, 247, 255).CGColor;
//        [upBtn addTarget:weakSelf action:@selector(upSystemAction:) forControlEvents:UIControlEventTouchUpInside];
//        upBtn.font = [UIFont fontWithName:FontName size:24];
//        [upBtn setTitle:@"立即升级" forState:UIControlStateNormal];
//        [upBtn setTintColor: RGBCOLOR(235, 247, 255)];
//        upBtn.layer.cornerRadius = 20;
//        upBtn.layer.masksToBounds = YES;
//        UIButton *deleteBtn = [UIButton new];
//        [deleteBtn addTarget:self action:@selector(removeAction:) forControlEvents:UIControlEventTouchUpInside];
//        [deleteBtn setBackgroundImage:[UIImage imageNamed:@"closed_big"] forState:UIControlStateNormal];
//        _deleteBtn = deleteBtn;
//        _upBtn = upBtn;
//        _upImageView = upImageView;
//
//        upImageView.layer.cornerRadius = 10;
//        upImageView.layer.masksToBounds = YES;
//        deleteBtn.layer.cornerRadius = 20;
//        deleteBtn.layer.masksToBounds = YES;
//        [self addSubview:upImageView];
//
//        [upImageView addSubview:self.tableView];
//        [self addSubview:deleteBtn];
//        [self addSubview:upBtn];
//
//        UILabel *banBenLabel = [UILabel new];
//        banBenLabel.text = _versionHaoStr;
//        banBenLabel.font = [UIFont fontWithName:FontName size:10];
//        banBenLabel.textAlignment = NSTextAlignmentCenter;
//        banBenLabel.backgroundColor = RGBCOLOR(28, 163, 251);
//        banBenLabel.textColor = RGBCOLOR(235, 247, 255);
//        [self addSubview:banBenLabel];
//        _banbenLabel = banBenLabel;
//        _banbenLabel.layer.cornerRadius = 9.5;
//        _banbenLabel.layer.masksToBounds = YES;
//        [_banbenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            if (iPhone6 || iPhone6P) {
//                make.right.equalTo(weakSelf).offset(-30);
//                make.width.equalTo(@80);
//                make.height.equalTo(@19);
//                make.centerY.equalTo(weakSelf).offset(-40);
//            } else {
//            make.right.equalTo(weakSelf).offset(-60);
//            make.width.equalTo(@65);
//            make.height.equalTo(@19);
//            make.centerY.equalTo(weakSelf).offset(-30);
//            }
//        }];
//        CGFloat BL;
//        BL = upImageView.image.size.height / upImageView.image.size.width;
//
//        [upImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(@(kScreenWidth - 50));
//            make.height.equalTo(@((kScreenWidth - 50) * BL));
//            make.center.equalTo(weakSelf);
//
//        }];
//
//        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.equalTo(weakSelf.upImageView).offset(20);
//            make.right.equalTo(weakSelf.upImageView).offset(15);
//            make.width.equalTo(@40);
//            make.height.equalTo(@40);
//        }];
//
//        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.left.equalTo(weakSelf).offset(60);
//            make.right.equalTo(weakSelf).offset(-60);
//            make.height.equalTo(@70);
//            make.centerX.equalTo(weakSelf.upImageView);
//            make.centerY.equalTo(weakSelf.upImageView).offset(30);
//
//        }];
//        if (iPhone4 | iPhone5) {
//            [upBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.bottom.equalTo(weakSelf.upImageView).offset(-40);
//                make.centerX.equalTo(weakSelf.upImageView);
//                make.width.equalTo(@150);
//                make.height.equalTo(@42);
//
//            }];
//
//        } else {
//            [upBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.bottom.equalTo(weakSelf.upImageView).offset(-45);
//                make.centerX.equalTo(weakSelf.upImageView);
//                make.width.equalTo(@218);
//                make.height.equalTo(@42);
//
//            }];
//
//        }
//
//    }
//    return self;
//}
//
//
//
//
//
//
//
@end
