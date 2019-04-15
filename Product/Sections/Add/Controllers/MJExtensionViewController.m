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
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale),
                           @"gay" : @"true"
                           //   @"gay" : @"1"
                           //   @"gay" : @"NO"
                           };
    
    
    User *user = [User mj_objectWithKeyValues:dict];
    
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
