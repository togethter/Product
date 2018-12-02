//
//  MementoCenter.m
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "MementoCenter.h"

@implementation MementoCenter

+ (void)saveMementoObject:(id<MementoCenterProtocol>)object withKey:(NSString *)key {
    NSParameterAssert(object);
    NSParameterAssert(key);
    id data = [object currentState];
    NSData *tmpData = nil;
    if (tmpData) {
        [[NSUserDefaults standardUserDefaults] setObject:tmpData forKey:key];
    }
}

+ (id)mementoObjectWithKey:(NSString *)key {
    NSParameterAssert(key);
    id data = nil;
    NSData *tmpData = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (tmpData) {
        data =  nil;
    }
    return data;
}

@end
