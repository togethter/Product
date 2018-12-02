//
//  UITableView+XLUtil.m
//  XLTableDataSourceDemo
//
//  Created by eHome on 17/2/20.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "UITableView+XLUtil.h"

@implementation UITableView (XLUtil)

- (void)registerNibCellClass:(Class)cellClass
{
    NSString *cellClassName = NSStringFromClass(cellClass);
    UINib *nibCell = [UINib nibWithNibName:cellClassName bundle:nil];
    
    [self registerNib:nibCell forCellReuseIdentifier:cellClassName];
}

- (void)registerCellClass:(Class)cellClass
{
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerCellClasses:(NSArray *)cellClasses
{
    for (Class cellClass in cellClasses) {
        [self registerCellClass:cellClass];
    }
}

- (void)registerNibCellClasses:(NSArray *)cellClasses
{
    for (Class cellClass in cellClasses) {
        [self registerNibCellClass:cellClass];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                     delegate:(id<UITableViewDelegate>)delegate
                   dataSource:(id<UITableViewDataSource>)dataSource
{
    if (self = [self initWithFrame:frame style:style]) {
        self.delegate  = delegate;
        self.dataSource = dataSource;
        self.separatorStyle= UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}

@end
