//
//  DateViewController.m
//  Product
//
//  Created by 李学良 on 2018/10/19.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "DateViewController.h"
#import "LibiaryTableViewCell.h"
@interface DateViewController ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) XLTableViewDelegate *tableViewDelegate;
@property (nonatomic,strong) XLTableViewDataSource *tableViewDataSource;
@property (nonatomic,strong) XLTableDataItem *dataItem;


@end

@implementation DateViewController





- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain delegate:self.tableViewDelegate dataSource:self.tableViewDataSource];
        [_tableView registerNib:[UINib nibWithNibName:@"LibiaryTableViewCell" bundle:nil] forCellReuseIdentifier:@"LibiaryTableViewCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (XLTableViewDataSource *)tableViewDataSource
{
    if (!_tableViewDataSource) {
        _tableViewDataSource = [XLTableViewDataSource dataSourceWithItem:self.dataItem];
    }
    return _tableViewDataSource;
}

- (XLTableViewDelegate *)tableViewDelegate
{
    if (!_tableViewDelegate) {
        _tableViewDelegate = [XLTableViewDelegate delegateWithDataItem:self.dataItem];
    }
    return _tableViewDelegate;
}
- (XLTableDataItem *)dataItem
{
    if (!_dataItem) {
        _dataItem = [XLTableDataItem dataItem];
    }
    return _dataItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self loadDataSource];
    self.tableViewDelegate.didSelectRowAtIndexPath = ^(UITableView *tableView, NSIndexPath *indexPath, id rowData, NSString *cellClassName) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    };

}

- (void)loadDataSource
{
    [self.dataItem clearData];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        LibiaryModel *model = [[LibiaryModel  alloc] init];
        model.bookName = [NSString stringWithFormat:@"bookName%d",i];
        model.bookDestail = [NSString stringWithFormat:@"占个奥德赛闹大介绍来的哈老师大山里的骄傲是多久爱劳动就爱上了大精神鲁大师%d",i];
        [array addObject:model];
    }
    [self.dataItem addCellClass:[LibiaryTableViewCell class] dataItems:array delegate:self];
    [self.tableView reloadData];
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
