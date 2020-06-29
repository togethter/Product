//
//  MineController.m
//  Product
//
//  Created by GD on 2020/6/29.
//  Copyright © 2020 李学良. All rights reserved.
//

#import "MineController.h"

@interface MineController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation MineController

- (UITableView *)tableView {
    if (!_tableView) {
       _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.edgesForExtendedLayout = UIRectEdgeTop;
    
   
}
- (void)configUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
- (void)configNavigationBar {
    [super configNavigationBar];
    [self.navigationController barStyle:(theme)];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resuseIdentifer"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"resuseIdentifer"];
    }
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor redColor];
    }
    else if (indexPath.row == 1) {
        cell.backgroundColor = [UIColor greenColor];
    } else if (indexPath.row == 2) {
        cell.backgroundColor = [UIColor yellowColor];
    }
    return cell;
}

@end
