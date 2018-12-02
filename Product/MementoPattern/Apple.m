//
//  Apple.m
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "Apple.h"

@implementation Apple

- (id)currentState {
    return @{@"name":self.name,
             @"age":self.age
             };
}

- (void)recoverFromState:(id)state {
    NSDictionary *data = state;
    self.name = data[@"name"];
    self.age = data[@"age"];
}



@end

