//
//  Builder.m
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "Builder.h"

@implementation Builder

- (void)buildAllParts {
    [self.engine build];
    [self.wheels build];
    [self.door build];
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    dataDic[@"engine"] = [self.engine infomation];
    dataDic[@"wheels"] = [self.wheels infomation];
    dataDic[@"door"]   = [self.door infomation];
    self.prodocutsInfo = dataDic;
}

@end
