//
//  UserInfoManagerCenter.m
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "UserInfoManagerCenter.h"
static UserInfoManagerCenter *center = nil;
@implementation UserInfoManagerCenter

+ (instancetype)managerCenter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = (UserInfoManagerCenter *)@"UserInfoManagerCenter";
        center = [[UserInfoManagerCenter alloc] init];
    });
    NSString *classString = NSStringFromClass([self class]);
    if ([classString isEqualToString:@"UserInfoManagerCenter"] == NO) {
        NSParameterAssert(nil);
    }
    
    return center;
}


- (instancetype)init {
    NSString *string = (NSString *)center;
    if ([string isKindOfClass:[NSString class]] == YES && [string isEqualToString:@"UserInfoManagerCenter"]) {
        self = [super init];
        if (self) {
            NSString *classString = NSStringFromClass([self class]);
            if ([classString isEqualToString:@"UserInfoManagerCenter"] == NO) {
                NSParameterAssert(nil);
            }
        }
        return self;
    } else {
        return nil;
    }
}

@end
