//
//  SystemUpModel.m
//  ChongFa
//
//  Created by bilin on 16/11/1.
//  Copyright © 2016年 lixueliang. All rights reserved.
//

#import "SystemUpModel.h"

@implementation SystemUpModel


- (instancetype)init{
    if (self = [super init]) {
        self.versionArray = [NSMutableArray array];
        self.versionDicArr = [NSMutableDictionary dictionary];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"updateAll"]) {
        self.updateAll = [NSString stringWithFormat:@"%@", value];
    }
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"versionArray =%@\n,versionDicArr = %@\n, updateAll =%@",self.versionArray,self.versionDicArr,self.updateAll];
}
@end
