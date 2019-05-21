//
//  MJExtensionViewController.m
//  Product
//
//  Created by is on 2019/4/12.
//  Copyright © 2019 李学良. All rights reserved.
//

#import "MJExtensionViewController.h"
#import "User.h"
#import <MJExtension.h>
#import "objc/runtime.h"
#import "Global.h"
#import "StyleDIY.h"
#import "QQLBXScanViewController.h"
static char TAG_ACTIVITY_INDICATOR;
static char imageURLKey;
@interface MJExtensionViewController ()

@end

@implementation MJExtensionViewController


- (nullable NSURL *)sd_imageURL {
  return objc_getAssociatedObject(self, &imageURLKey);
}

- (NSProgress *)sd_imageProgress {
  NSProgress *progress = objc_getAssociatedObject(self, @selector(sd_imageProgress));
  if (!progress) {
    progress = [[NSProgress alloc] initWithParent:nil userInfo:nil];
    self.sd_imageProgress = progress;
  }
  return progress;
}


- (void)setSd_imageProgress:(NSProgress *)sd_imageProgress {
  objc_setAssociatedObject(self, @selector(sd_imageProgress), sd_imageProgress, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  NSProgress *progress = self.sd_imageProgress;
  
    NSDictionary *dict = @{
                           @"aName" : @(10),
                           @"icon" : @"lufy.png",
                           @"age" : @"284467440737095516101844674407370955161",
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale),
                           @"gay" : @"true",
                           @"childrens": @(100000000000000),
                           @"mather": @(1),
                           @"pets":@{@"name":@"20",@"age":@"1kl"},
                           @"workPricence":@[@{@"companyName":@"徐州比邻网络",
                                               @"companyAge":@"3i"
                                               },
                                             @{@"companyName":@"上海勤和网络科技有限公司"},
                                             @{@"comanyAge":@"1"},
                                             ]
                           };
  
    
    User *user = [User loadModelWithDictionary:dict];
  
  UILabel *label = [UILabel new];
//  label.text = [NSString stringWithFormat:@"%@",@(user.height)];
  NSLog(@"%f",user.height);
  NSLog(@"%@",@(user.height));
  label.text = user.name;
  [self.view addSubview:label];
  [label sizeToFit];
  label.center = self.view.center;
  
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
  [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
  [button setTitle:@"buttonClick" forState:UIControlStateNormal];
  
  [self.view addSubview:button];
  
  [button mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.mas_equalTo(self.view);
    make.width.mas_equalTo(100);
    make.height.mas_equalTo(20);
  }];
  
  
  
}
- (void)buttonAction:(UIButton *)button {
  QQLBXScanViewController *vc = [QQLBXScanViewController new];
  vc.style = [StyleDIY ZhiFuBaoStyle];
  vc.isOpenInterestRect = YES;
  vc.libraryType = [Global sharedManager].libraryType;
  vc.scanCodeType = [Global sharedManager].scanCodeType;
  [self.navigationController pushViewController:vc animated:YES];
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
