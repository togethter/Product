//
//  ScrollowConfig.m
//  Product
//
//  Created by 李学良 on 2018/12/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "ScrollowConfig.h"

@implementation ScrollowConfig
- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.leftRightMargin = 15;
    self.margin = 15;
    self.titleScrollowH = 15;
    self.normalTitleColor = rgb(28, 28, 28);
    self.selctTitleColor = rgb(28, 28, 28);
    self._lineViewColor = rgb(28, 28, 28);
    self._lineView_bottom = 8;
    self.normalFont =  [UIFont fontWithName:@"PingFangSC-Medium" size:(13)];
    self.selectFont = [UIFont fontWithName:@"PingFangSC-Semibold" size:(13)];
    self.lineViewWidth = (45);
    self.lineViewHeight = (2);
    self.choiceIndex = 0;
    return self;
}
@end
