//
//  AdapterViewController.m
//  Product
//
//  Created by 李学良 on 2018/10/24.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "AdapterViewController.h"
#import "BusinessCardView.h"

#import "Model.h"
#import "ModelAdapter.h"

#import "NewCardModel.h"
#import "NewCardModelApater.h"

#import "CardAdapter.h"
@interface AdapterViewController ()

@end

@implementation AdapterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    self.view.backgroundColor = [UIColor whiteColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
