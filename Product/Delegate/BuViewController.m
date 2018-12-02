//
//  BuViewController.m
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "BuViewController.h"
#import "Customer.h"
#import "TcpProtocol.h"
#import "ConcreteProxy.h"
@interface BuViewController ()<CustomerDelegate>

@property (nonatomic) NSInteger sourcePort;
@property (nonatomic) NSInteger destinationport;

@end

@implementation BuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.\
    
    Customer *customer = [[Customer alloc] init];
    customer.delegate = self;
    [customer buyItemCount:5];
    
    
#pragma mark -
    ConcreteProxy *proxy = [ConcreteProxy alloc];
    proxy.delegate = self;
    [proxy helloWorld];
    [proxy goodBye];
    
    
}

- (void)helloWorld {
    NSLog(@"xxxx");
}

- (void)customer:(Customer *)customer buyItemCount:(NSInteger)count {
    NSLog(@"%ld",count);
}


- (void)accessTCPData:(id<TcpProtocol>)data {
    self.sourcePort = [data sourcePort];
    self.destinationport = [data destinationPort];
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
