//
//  LibiaryTableViewCell.m
//  Product
//
//  Created by 李学良 on 2018/10/20.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "LibiaryTableViewCell.h"

@implementation LibiaryModel

- (NSString *)libiaryTableViewCellBookName
{
    return self.bookName;
}
- (NSString *)libiaryTableViewCellBookBookDestail
{
    return self.bookDestail;
}

@end

@interface LibiaryTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *bookDestailLb;

@end
@implementation LibiaryTableViewCell


+ (CGFloat)cellHeightForData:(id)data
{
    return 159.f;
}

- (void)bindData:(id<LibiaryTableViewCellDelegate>)data
{
    self.nameLb.text        = data.libiaryTableViewCellBookName;
    self.bookDestailLb.text = data.libiaryTableViewCellBookBookDestail;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
