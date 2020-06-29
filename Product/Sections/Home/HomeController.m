//
//  HomeController.m
//  Product
//
//  Created by GD on 2020/6/29.
//  Copyright © 2020 李学良. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()
@property (nonatomic,strong) UILabel *label;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configNavigationBar {
    [super configNavigationBar];
}

- (void)configUI {
    self.label = [[UILabel alloc] init];
    self.label.text = @"home";
    [self.view addSubview:self.label];
    self.label.center = self.view.center;
}



@end
