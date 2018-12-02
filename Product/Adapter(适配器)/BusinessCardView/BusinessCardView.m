//
//  BusinessCardView.m
//  Product
//
//  Created by 李学良 on 2018/10/24.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "BusinessCardView.h"

@interface BusinessCardView ()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UILabel *phoneNumberLable;


@end
@implementation BusinessCardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 0.5;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(5, 5);
    self.layer.shadowRadius = 1.f;
    self.nameLabel      = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 150, 25)];
    self.nameLabel.font = [UIFont fontWithName:@"Avenir-Light" size:20.f];
    [self addSubview:self.nameLabel];
    
    
    self.lineView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 45, 200, 5)];
    [self addSubview:self.lineView];
    
    
    self.phoneNumberLable               = [[UILabel alloc] initWithFrame:CGRectMake(41, 105, 150, 20)];
    self.phoneNumberLable.textAlignment = NSTextAlignmentRight;
    self.phoneNumberLable.font          = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:16.f];
    [self addSubview:self.phoneNumberLable];
}


- (void)loadData:(id<BusinessCardAdapterProtocol>)data
{
    self.nameLabel.text = [data name];
    self.lineColor = [data lineColor];
    self.phoneNumberLable.text  = [data phoneNumber];
}



- (void)setName:(NSString *)name
{
    _name = name;
    _nameLabel.text = name;
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    _lineView.backgroundColor = lineColor;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}






@end
