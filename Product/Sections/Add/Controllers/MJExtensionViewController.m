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
@interface MJExtensionViewController ()

@end

@implementation MJExtensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *dict = @{
                           @"aName" : @(10),
                           @"icon" : @"lufy.png",
                           @"age" : @"284467440737095516101844674407370955161",
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale),
                           @"gay" : @"true",
                           @"pets":@{@"name":@"20",@"age":@"10"},
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
