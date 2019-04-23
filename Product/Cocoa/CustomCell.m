//
//  CustomCell.m
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCell];
        [self buildSubView];
    }
    return self;
}

- (void)setupCell {

}

- (void)buildSubView {
    
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
