//
//  XLDataSource.h
//  XLTableDataSourceDemo
//
//  Created by BrefChan on 17/2/15.
//  Copyright © 2017年 BrefChan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XLTableDataItem.h"

@interface XLTableViewDataSource : NSObject<UITableViewDataSource>

+ (instancetype)dataSourceWithItem:(XLTableDataItem *)dataItem;

- (instancetype)initWithDataItem:(XLTableDataItem *)dataItem;


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;


@end
