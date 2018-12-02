//
//  ImplementViewController.m
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "ImplementViewController.h"
#import "Builder.h"
#import "Engine.h"
#import "YEngine.h"
#import "Wheels.h"
#import "Door.h"
@interface ImplementViewController ()
@property (nonatomic, strong) Builder *builder;

@end

@implementation ImplementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.builder = [[Builder alloc] init];
    self.builder.engine = [[YEngine alloc] init];
    self.builder.wheels = [[Wheels alloc] init];
    self.builder.door = [[Door alloc] init];
    [self.builder buildAllParts];
    NSLog(@"%@",self.builder.prodocutsInfo);
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
