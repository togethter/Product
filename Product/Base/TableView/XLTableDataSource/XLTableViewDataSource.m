//
//  XLDataSource.m
//  XLTableDataSourceDemo
//
//  Created by BrefChan on 17/2/15.
//  Copyright © 2017年 BrefChan. All rights reserved.
//

#import "XLTableViewDataSource.h"
#import "XLBaseTableViewCell.h"

@interface XLTableViewDataSource()

@property (nonatomic, strong) XLTableDataItem *dataItem;

@end


@implementation XLTableViewDataSource

+ (instancetype)dataSourceWithItem:(XLTableDataItem *)dataItem
{
    XLTableViewDataSource *dataSource = [[XLTableViewDataSource alloc] initWithDataItem:dataItem];
    return dataSource;
}

- (instancetype)initWithDataItem:(XLTableDataItem *)dataItem
{
    self = [super init];
    if (self) {
        self.dataItem = dataItem;
    }
    return self;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataItem.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    XLTableSectionDataItem *sectionItem = self.dataItem.items[section];
    
    return sectionItem.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLTableSectionDataItem *sectionItem = self.dataItem.items[indexPath.section];
    XLTableCellDataItem *cellItem = sectionItem.cells[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellItem.cellClassName forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[XLBaseTableViewCell class]]) {
        XLBaseTableViewCell *tableViewCell = (XLBaseTableViewCell *)cell;
        
        tableViewCell.delegate = cellItem.cellDelegate;
        
        [tableViewCell bindData:cellItem.cellData];
    }
    
    return cell;
}



@end
