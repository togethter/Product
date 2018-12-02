//
//  MementoCenter+MementoCenter.m
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "MementoCenter+MementoCenter.h"

@implementation MementoCenter (MementoCenter)

- (void)saveStateWithKey:(NSString *)key {
    NSParameterAssert(key);
    id <MementoCenterProtocol> obj = (id <MementoCenterProtocol>)self;
    if ([obj respondsToSelector:@selector(currentState)]) {
        [MementoCenter saveMementoObject:obj withKey:key];
    }
}


- (void)recoverFromStateWithKey:(NSString *)key {
    NSParameterAssert(key);
    id state = [MementoCenter mementoObjectWithKey:key];
    id <MementoCenterProtocol> obj = (id <MementoCenterProtocol>)self;
    if ([obj respondsToSelector:@selector(recoverFromStateWithKey:)]) {
        [obj recoverFromState:state];
    }
}
@end
