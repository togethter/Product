//
//  LibiaryTableViewCell.h
//  Product
//
//  Created by 李学良 on 2018/10/20.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "XLBaseTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@protocol LibiaryTableViewCellDelegate <NSObject>

@optional
- (NSString *)libiaryTableViewCellBookName;
- (NSString *)libiaryTableViewCellBookBookDestail;

@end
@interface LibiaryTableViewCell : XLBaseTableViewCell

@end

NS_ASSUME_NONNULL_END


@interface LibiaryModel: NSObject<LibiaryTableViewCellDelegate>
@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, copy) NSString *bookDestail;
@end
