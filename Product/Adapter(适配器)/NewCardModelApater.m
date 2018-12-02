//
//  NewCardModelApater.m
//  Product
//
//  Created by 李学良 on 2018/10/24.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "NewCardModelApater.h"
#import "NewCardModel.h"
@implementation NewCardModelApater


- (instancetype)initWithData:(id)data {
    self = [super initWithData:data];
    if (!self) {
        return nil;
    }
    return self;
}

- (NSString *)name {
    NewCardModel *data = self.data;
    return data.name;
}
- (UIColor *)lineColor {
    
    NewCardModel *data = self.data;
    
    // todo
    
    if ([data.colorHexString isEqualToString:@"black"]) {
        
        return [UIColor blackColor];
        
    } else {
        
        return [UIColor redColor];
        
    }
}

- (NSString *)phoneNumber {
    
    NewCardModel *data = self.data;
    
    return data.phoneNumber;
}
@end
