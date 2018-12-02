//
//  XLTableViewDelegate.m
//  XLTableDataSourceDemo
//
//  Created by eHome on 17/2/15.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "XLTableViewDelegate.h"
#import "XLBaseTableViewCell.h"
#import "XLBaseTableHeaderView.h"
#import "XLBaseTableFooterView.h"
#import "UIView+XLUtil.h"


@interface XLTableViewDelegate()

@property (nonatomic, strong) XLTableDataItem *dataItem;

@end

@implementation XLTableViewDelegate


+ (instancetype)delegateWithDataItem:(XLTableDataItem *)dataItem
{
    XLTableViewDelegate *delegate = [[XLTableViewDelegate alloc] initWithDataItem:dataItem];
    return delegate;
}

- (instancetype)initWithDataItem:(XLTableDataItem *)dataItem
{
    self = [super init];
    if (self) {
        self.dataItem = dataItem;
    }
    return self;
}

//display
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[XLBaseTableViewCell class]]) {
        XLTableSectionDataItem *sectionItem = self.dataItem.items[indexPath.section];
        XLTableCellDataItem *cellItem = sectionItem.cells[indexPath.row];
        XLBaseTableViewCell *tableViewCell = (XLBaseTableViewCell *)cell;
        [tableViewCell cellWillDisplayByData:cellItem.cellData];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if ([view isKindOfClass:[XLBaseTableHeaderView class]]) {
        XLTableSectionDataItem *sectionItem = self.dataItem.items[section];
        XLBaseTableHeaderView *tableHeaderView = (XLBaseTableHeaderView *)view;
        
        [tableHeaderView headerWillDisplayByData:sectionItem.sectionHeaderData];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    if ([view isKindOfClass:[XLBaseTableFooterView class]]) {
        XLTableSectionDataItem *sectionItem = self.dataItem.items[section];
        XLBaseTableFooterView *tableFooterView = (XLBaseTableFooterView *)view;
        
        [tableFooterView footerWillDisplayByData:sectionItem.sectionFooterData];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if ([cell isKindOfClass:[XLBaseTableViewCell class]]) {
        XLTableSectionDataItem *sectionItem = self.dataItem.items[indexPath.section];
        XLTableCellDataItem *cellItem = sectionItem.cells[indexPath.row];
        XLBaseTableViewCell *tableViewCell = (XLBaseTableViewCell *)cell;
        [tableViewCell cellDidEndDisplayByData:cellItem.cellData];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if ([view isKindOfClass:[XLBaseTableHeaderView class]]) {
        XLTableSectionDataItem *sectionItem = self.dataItem.items[section];
        XLBaseTableHeaderView *tableHeaderView = (XLBaseTableHeaderView *)view;
        
        [tableHeaderView headerDidEndDisplayByData:sectionItem.sectionHeaderData];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
{
    if ([view isKindOfClass:[XLBaseTableFooterView class]]) {
        XLTableSectionDataItem *sectionItem = self.dataItem.items[section];
        XLBaseTableFooterView *tableFooterView = (XLBaseTableFooterView *)view;
        
        [tableFooterView footerDidEndDisplayByData:sectionItem.sectionFooterData];
    }
}

//height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataItem cellHeightForIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat sectionHeaderHeight = [self.dataItem headerHeightForSection:section];

    return sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat sectionFooterHeight = [self.dataItem footerHeightForSection:section];

    return sectionFooterHeight;
}

//view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    XLTableSectionDataItem *sectionItem = self.dataItem.items[section];
 
    if (self.viewForHeaderInSection) {
        UIView *customerSectionHeaderView = self.viewForHeaderInSection(tableView,section,sectionItem);
        return customerSectionHeaderView;
    }
    
    CGFloat sectionHeaderHeight = [self.dataItem headerHeightForSection:section];
    UIView *header;
    
    if (sectionItem.headerNibClass) {
        header = [sectionItem.headerNibClass viewFromXib];
    }else if (sectionItem.headerClass)
    {
        header = [[sectionItem.headerClass alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, sectionHeaderHeight)];
    }else
    {
        header = [UIView new];
    }
    
    
    if ([header isKindOfClass:[XLBaseTableHeaderView class]]) {
        XLBaseTableHeaderView *tableHeaderView = (XLBaseTableHeaderView *)header;
        [tableHeaderView bindData:sectionItem.sectionHeaderData];
        if (sectionItem.sectionHeaderDelegate) {
            tableHeaderView.delegate = sectionItem.sectionHeaderDelegate;
        }
    }
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    XLTableSectionDataItem *sectionItem = self.dataItem.items[section];
    
    if (self.viewForFooterInSection) {
        UIView *customerSectionFooterView = self.viewForFooterInSection(tableView,section,sectionItem);
        return customerSectionFooterView;
    }
    
    CGFloat sectionFooterHeight = [self.dataItem footerHeightForSection:section];
    
    UIView *footer;
    if (sectionItem.footerNibClass) {
        footer = [sectionItem.footerNibClass viewFromXib];
    }else if (sectionItem.footerClass)
    {
        footer = [[sectionItem.footerClass alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, sectionFooterHeight)];
    }else
    {
        footer = [UIView new];
    }
    
    
    if ([footer isKindOfClass:[XLBaseTableFooterView class]]) {
        XLBaseTableFooterView *tableFooterView = (XLBaseTableFooterView *)footer;
        [tableFooterView bindData:sectionItem.sectionFooterData];
        if (sectionItem.sectionFooterDelegate) {
            tableFooterView.delegate = sectionItem.sectionFooterDelegate;
        }
    }
    return footer;
}

//highlighting
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.shouldHighlightRowAtIndexPath) {
        id rowData = [self.dataItem cellDataForIndexPath:indexPath];
        self.shouldHighlightRowAtIndexPath(tableView,indexPath,rowData);
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didHighlightRowAtIndexPath) {
        id rowData = [self.dataItem cellDataForIndexPath:indexPath];
        self.didHighlightRowAtIndexPath(tableView,indexPath,rowData);
    }
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didUnhighlightRowAtIndexPath) {
        id rowData = [self.dataItem cellDataForIndexPath:indexPath];
        self.didUnhighlightRowAtIndexPath(tableView,indexPath,rowData);
    }
}

//select
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.willSelectRowAtIndexPath) {
        NSString *className = [self.dataItem cellClassNameForIndexPath:indexPath];
        id rowData = [self.dataItem cellDataForIndexPath:indexPath];
        self.willSelectRowAtIndexPath(tableView,indexPath,rowData,className);
    }
    
    return indexPath;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.willDeselectRowAtIndexPath) {
        NSString *className = [self.dataItem cellClassNameForIndexPath:indexPath];
        id rowData = [self.dataItem cellDataForIndexPath:indexPath];
        self.willDeselectRowAtIndexPath(tableView,indexPath,rowData,className);
    }
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSelectRowAtIndexPath) {
        NSString *className = [self.dataItem cellClassNameForIndexPath:indexPath];
        id rowData = [self.dataItem cellDataForIndexPath:indexPath];
        self.didSelectRowAtIndexPath(tableView,indexPath,rowData,className);
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didDeselectRowAtIndexPath) {
        NSString *className = [self.dataItem cellClassNameForIndexPath:indexPath];
        id rowData = [self.dataItem cellDataForIndexPath:indexPath];
        self.didDeselectRowAtIndexPath(tableView,indexPath,rowData,className);
    }
}

#pragma mark - Setter
- (void)setViewForHeaderInSection:(ViewForHeaderInSection)viewForHeaderInSection
{
    _viewForHeaderInSection = [viewForHeaderInSection copy];
}

- (void)setViewForFooterInSection:(ViewForFooterInSection)viewForFooterInSection
{
    _viewForFooterInSection = [viewForFooterInSection copy];
}

- (void)setShouldHighlightRowAtIndexPath:(ShouldHighlightRowAtIndexPath)shouldHighlightRowAtIndexPath
{
    _shouldHighlightRowAtIndexPath = [shouldHighlightRowAtIndexPath copy];
}

- (void)setDidHighlightRowAtIndexPath:(DidHighlightRowAtIndexPath)didHighlightRowAtIndexPath
{
    _didHighlightRowAtIndexPath = [didHighlightRowAtIndexPath copy];
}

- (void)setDidUnhighlightRowAtIndexPath:(DidUnhighlightRowAtIndexPath)didUnhighlightRowAtIndexPath
{
    _didUnhighlightRowAtIndexPath = [didUnhighlightRowAtIndexPath copy];
}
- (void)setWillSelectRowAtIndexPath:(WillSelectRowAtIndexPath)willSelectRowAtIndexPath
{
    _willSelectRowAtIndexPath = [willSelectRowAtIndexPath copy];
}

- (void)setWillDeselectRowAtIndexPath:(WillSelectRowAtIndexPath)willSelectRowAtIndexPath
{
    _willSelectRowAtIndexPath = [willSelectRowAtIndexPath copy];
}

- (void)setDidSelectRowAtIndexPath:(DidSelectRowAtIndexPath)didSelectRowAtIndexPath
{
    _didSelectRowAtIndexPath = [didSelectRowAtIndexPath copy];
}

- (void)setDidDeselectRowAtIndexPath:(DidDeselectRowAtIndexPath)didDeselectRowAtIndexPath
{
    _didDeselectRowAtIndexPath = [didDeselectRowAtIndexPath copy];
}

@end
