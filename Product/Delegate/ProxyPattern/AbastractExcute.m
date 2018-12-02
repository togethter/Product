//
//  AbastractExcute.m
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "AbastractExcute.h"

@implementation AbastractExcute
+ (instancetype)shareInstance {
    static AbastractExcute *excute = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        excute  = [[AbastractExcute alloc] init];
    });
    return excute;
}

- (void)nullExcute:(NSArray *)infos {
    if (infos.count == 3) {
        NSLog(@"%@ 设置了代理，但该代理没有现实%@方法",infos[0],infos[1]);
    } else {
        NSLog(@"%@ 没有设置代理,方法%@没有执行",infos[0],infos[1]);
    }
}
@end

