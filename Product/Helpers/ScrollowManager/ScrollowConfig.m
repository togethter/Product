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
    self.leftRightMargin = 20.f;
    self.margin = 30.f;
    self.titleScrollowH = 45.f;
    self.normalTitleColor = [UIColor darkGrayColor];
    self.selctTitleColor = [UIColor redColor];
    self._lineViewColor = [UIColor redColor];
    self._lineView_bottom = 5.f;
    self.font = [UIFont systemFontOfSize:17];
    return self;
}
@end
