//
//  BaseModel.m
//  ChongFa
//
//  Created by bilin on 2016/12/5.
//  Copyright © 2016年 lixueliang. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
- (void)setValue:(id)value forKey:(NSString *)key {
    if ([value isKindOfClass:[NSNumber class]]) {
        [self setValue:[NSString stringWithFormat:@"%@",value] forKey:key];
    } else {
        [super setValue:value forKey:key];
    }
    
}

- (void)setNilValueForKey:(NSString *)key
{
    [self setValue:@"" forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}


/**对象 初始化方法*/
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
/** 类 初始化方法*/
+ (instancetype)loadModelWithDictionary:(NSDictionary *)dic
{
    return [[self alloc] initWithDictionary:dic];
}
@end
