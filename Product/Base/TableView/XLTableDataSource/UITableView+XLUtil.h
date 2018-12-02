//
//  UITableView+XLUtil.h
//  XLTableDataSourceDemo
//
//  Created by eHome on 17/2/20.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (XLUtil)

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                     delegate:(id<UITableViewDelegate>)delegate
                   dataSource:(id<UITableViewDataSource>)dataSource;

- (void)registerNibCellClass:(Class)cellClass;

- (void)registerNibCellClasses:(NSArray *)cellClasses;

- (void)registerCellClass:(Class)cellClass;

- (void)registerCellClasses:(NSArray *)cellClasses;

@end
