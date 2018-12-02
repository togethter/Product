//
//  XLTableDataItem.m
//  XLTableDataSourceDemo
//
//  Created by eHome on 17/2/16.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "XLTableDataItem.h"
#import "XLBaseTableHeaderView.h"
#import "XLBaseTableFooterView.h"
#import "XLBaseTableViewCell.h"
#import "UIView+XLUtil.h"

@implementation XLTableSectionDataItem

@end

@implementation XLTableCellDataItem

@end

@implementation XLTableDataItem

+ (instancetype)dataItem
{
    XLTableDataItem *item = [[XLTableDataItem alloc] init];
    return item;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = [NSMutableArray array];
    }
    return self;
}

- (id)firstData
{
    if (self.items && self.items.count > 0) {
        XLTableSectionDataItem *sectionData = [self.items objectAtIndex:0];
        if (sectionData && sectionData.cells && sectionData.cells.count > 0) {
            XLTableCellDataItem *cellData = [sectionData.cells firstObject];
            return cellData.cellData;
        }
    }
    return nil;
}

- (id)lastData
{
    if (self.items && self.items.count > 0) {
        XLTableSectionDataItem *sectionData = [self.items objectAtIndex:self.items.count - 1];
        if (sectionData && sectionData.cells && sectionData.cells.count > 0) {
            XLTableCellDataItem *cellData = [sectionData.cells lastObject];
            return cellData.cellData;
        }
    }
    return nil;
}

- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem
{
    [self addHeaderClass:headerClass headerDataItem:headerItem headerDelegate:nil footerClass:nil footerDataItem:nil footerDelegate:nil];
}

- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate
{
    [self addHeaderClass:headerClass headerDataItem:headerItem headerDelegate:headerDelegate footerClass:nil footerDataItem:nil footerDelegate:nil];
}

- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem footerClass:(Class)footerClass footerDataItem:(id)footerItem
{
    [self addHeaderClass:headerClass headerDataItem:headerItem headerDelegate:nil footerClass:footerClass footerDataItem:footerItem footerDelegate:nil];
}

- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate footerClass:(Class)footerClass footerDataItem:(id)footerItem footerDelegate:(id)footerDelegate
{
    if (self.items) {
        XLTableSectionDataItem *sectionSource = [[XLTableSectionDataItem alloc] init];
        
        sectionSource.headerClass = headerClass;
        sectionSource.footerClass = footerClass;
        sectionSource.sectionHeaderData = headerItem;
        sectionSource.sectionFooterData = footerItem;
        sectionSource.sectionHeaderDelegate = headerDelegate;
        sectionSource.sectionFooterDelegate = footerDelegate;
        
        [self.items addObject:sectionSource];
    }
}

- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem
{
    [self addHeaderNibClass:headerNibClass headerDataItem:headerItem headerDelegate:nil footerNibClass:nil footerDataItem:nil footerDelegate:nil];
}

- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate
{
    [self addHeaderNibClass:headerNibClass headerDataItem:headerItem headerDelegate:headerDelegate footerNibClass:nil footerDataItem:nil footerDelegate:nil];
}

- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem footerNibClass:(Class)footerNibClass footerDataItem:(id)footerItem
{
    [self addHeaderNibClass:headerNibClass headerDataItem:headerItem headerDelegate:nil footerNibClass:footerNibClass footerDataItem:footerItem footerDelegate:nil];
}

- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate footerNibClass:(Class)footerNibClass footerDataItem:(id)footerItem footerDelegate:(id)footerDelegate
{
    if (self.items) {
        XLTableSectionDataItem *sectionSource = [[XLTableSectionDataItem alloc] init];
        
        sectionSource.headerNibClass = headerNibClass;
        sectionSource.footerNibClass = footerNibClass;
        sectionSource.sectionHeaderData = headerItem;
        sectionSource.sectionFooterData = footerItem;
        sectionSource.sectionHeaderDelegate = headerDelegate;
        sectionSource.sectionFooterDelegate = footerDelegate;
        
        [self.items addObject:sectionSource];
    }
}


- (void)addCellClass:(Class)cellClass dataItem:(id)dataItem
{
    [self addCellClass:cellClass dataItems:@[dataItem] delegate:nil];
}

- (void)addCellClass:(Class)cellClass dataItem:(id)dataItem delegate:(id<NSObject>)delegate
{
    [self addCellClass:cellClass dataItems:@[dataItem] delegate:delegate];
}

- (void)addCellClass:(Class)cellClass dataItems:(NSArray *)dataItems
{
    [self addCellClass:cellClass dataItems:dataItems delegate:nil];
}

- (void)addCellClass:(Class)cellClass dataItems:(NSArray *)dataItems delegate:(id<NSObject>)delegate
{
    XLTableSectionDataItem *sectionSource = [self.items lastObject];
    
    if (self.items && !sectionSource) {
        sectionSource = [[XLTableSectionDataItem alloc] init];
        [self.items addObject:sectionSource];
    }
    
    if (sectionSource) {
        NSMutableArray *sectionCells = sectionSource.cells;
        
        if (!sectionCells) {
            sectionCells = [NSMutableArray array];
            sectionSource.cells = sectionCells;
        }
        
        if (dataItems) {
            for (id dataItem in dataItems) {
                XLTableCellDataItem *cellItem = [[XLTableCellDataItem alloc] init];
                
                cellItem.cellClassName = NSStringFromClass(cellClass);
                cellItem.cellData = dataItem;
                cellItem.cellDelegate = delegate;
                
                [sectionCells addObject:cellItem];
            }
        } else {
            XLTableCellDataItem *cellSource = [[XLTableCellDataItem alloc] init];
            
            cellSource.cellClassName = NSStringFromClass(cellClass);
            cellSource.cellDelegate = delegate;
            
            [sectionCells addObject:cellSource];
        }
    }
}

- (void)clearData
{
    if (self.items) {
        [self.items removeAllObjects];
    }
}

- (id)cellDataForIndexPath:(NSIndexPath *)indexPath
{
    XLTableSectionDataItem *sectionItem = self.items[indexPath.section];
    XLTableCellDataItem *cellItem = sectionItem.cells[indexPath.row];
    
    return cellItem.cellData;

}

- (NSString *)cellClassNameForIndexPath:(NSIndexPath *)indexPath
{
    XLTableSectionDataItem *sectionItem = self.items[indexPath.section];
    XLTableCellDataItem *cellItem = sectionItem.cells[indexPath.row];
    
    return cellItem.cellClassName;
}

- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath
{
    XLTableSectionDataItem *sectionItem = self.items[indexPath.section];
    XLTableCellDataItem *cellItem = sectionItem.cells[indexPath.row];
    
    Class cellClass = NSClassFromString(cellItem.cellClassName);
    
    if ([cellClass isSubclassOfClass:[XLBaseTableViewCell class]]) {
        return [cellClass cellHeightForData:cellItem.cellData];
    }
    
    return 44.0f;
}

- (CGFloat)headerHeightForSection:(NSInteger)section
{
    XLTableSectionDataItem *sectionItem = self.items[section];
    
    Class headerClass = sectionItem.headerClass;
    
    if ([headerClass isSubclassOfClass:[XLBaseTableHeaderView class]]) {
        return [headerClass headerViewHeightForData:sectionItem.sectionHeaderData];
    }
    return 20.0f;
}

- (CGFloat)footerHeightForSection:(NSInteger)section
{
    XLTableSectionDataItem *sectionItem = self.items[section];
    
    Class footerClass = sectionItem.footerClass;
    
    if ([footerClass isSubclassOfClass:[XLBaseTableFooterView class]]) {
        return [footerClass footerViewHeightForData:sectionItem.sectionHeaderData];
    }
    return 20.0f;
}

- (id)sectionHeaderDataItemForSection:(NSInteger)section
{
    XLTableSectionDataItem *sectionItem = self.items[section];
    return sectionItem.sectionHeaderData;
}

- (id)sectionFooterDataItemForSection:(NSInteger)section
{
    XLTableSectionDataItem *sectionItem = self.items[section];
    return sectionItem.sectionFooterData;
}



@end
