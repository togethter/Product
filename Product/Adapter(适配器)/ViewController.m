//
//  ViewController.m
//  NormalProblem
//
//  Created by YouXianMing on 15/7/25.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "BusinessCardView.h"

#import "Model.h"
#import "ModelAdapter.h"

#import "NewCardModel.h"
#import "NewCardModelApater.h"

#import "CardAdapter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    BusinessCardView *cardView = [[BusinessCardView alloc] initWithFrame:BUSINESS_FRAME];
    cardView.center            = self.view.center;
    
    // 直接赋值
//    cardView.name        = @"JiKeXueYuan";
//    cardView.lineColor   = [UIColor redColor];
//    cardView.phoneNumber = @"101 - 5687 - 000";
    
    // 以对象赋值
    Model *model      = [[Model alloc] init];
    model.name        = @"JiKeXueYuan";
    model.lineColor   = [UIColor redColor];
    model.phoneNumber = @"101 - 5687 - 000";
    
    NewCardModel *newCardModel  = [[NewCardModel alloc] init];
    newCardModel.name           = @"JiKeXueYuan";
    newCardModel.colorHexString = @"black";
    newCardModel.phoneNumber    = @"101 - 5687 - 000";
    
    // 与输入建立联系
    BusinessCardAdapter *modelAdapter = [[CardAdapter alloc] initWithData:model];
    
    // 与输出建立联系
    [cardView loadData:modelAdapter];
    
    [self.view addSubview:cardView];
}

@end
