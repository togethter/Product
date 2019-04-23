//
//  BaseModel.m
//  ChongFa
//
//  Created by bilin on 2016/12/5.
//  Copyright © 2016年 lixueliang. All rights reserved.
//

#import "BaseModel.h"

NSString *const classKey = @"classKey";
NSString *const isModelArray = @"isModelArray";

@implementation BaseModel
- (void)setValue:(id)value forKey:(NSString *)key {
  if (value && ![value isKindOfClass:[NSNull class]]) {
    
    if ([value isKindOfClass:[NSNumber class]]) {
      value = [NSString stringWithFormat:@"%@",value];
    }
     // 用服务器的key去找字典里面的新key去给模型赋值
    NSString *modelKey  =  self.specialServerKeyFindModelKeyDic[key];
    if (modelKey) {
      [self modelSetValue:value forkey:modelKey];
    } else {
      // 下划线到驼峰去赋值
      NSString *camelKey = [self camelFromUnderlineKey:key];
      if (camelKey) {
        [self modelSetValue:value forkey:camelKey];
      } else {
          // 服务器下发的key去赋值
        [self modelSetValue:value forkey:key];
      }
    }
  }
}

- (void)modelSetValue:(id)value forkey:(NSString *)key {

  if (self.modelKeyOrArrayModelKeyDic) {
    NSDictionary *modelOrModellInArrayDic = self.modelKeyOrArrayModelKeyDic[key];
    if (modelOrModellInArrayDic) {
    NSString *classStr =  modelOrModellInArrayDic[classKey];
    id isModelArrayObj =  modelOrModellInArrayDic[isModelArray];
      if (!classStr) {
        // 不是模型中的模型
        [super setValue:value forKey:key];
      } else if (isModelArrayObj && [isModelArrayObj boolValue]) {
        // 是数组模型
        if (value && [value isKindOfClass:[NSArray class]]) {
          NSMutableArray *modelArray = @[].mutableCopy;
          for (NSDictionary *dic in value) {
           id model =  [NSClassFromString(classStr) loadModelWithDictionary:dic];
            [modelArray addObject:model];
          }
          NSArray *modelArra = [NSArray arrayWithArray:modelArray];
          [super setValue:modelArra forKey:key];
        }
      } else {
        // 普通模型
        if (value && [value isKindOfClass:[NSDictionary class]]) {
          id model =  [NSClassFromString(classStr) loadModelWithDictionary:value];
          [super setValue:model forKey:key];
        }
      }
    }
  } else {
     // 不是模型中的模型
    [super setValue:value forKey:key];
  }
}

// 当给Int 赋值为nil 会调用该方法然后赋值为0
- (void)setNilValueForKey:(NSString *)key
{
  
}
// 当服务器下发数据给该模型赋值的时候找不到对应的key调用
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
  
}
// 
- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}


/**对象 初始化方法*/
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self initializeDefaultData];
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
/** 类 初始化方法*/
+ (instancetype)loadModelWithDictionary:(NSDictionary *)dic
{
    return [[self alloc] initWithDictionary:dic];
}

- (void)initializeDefaultData {
  
}

- (NSString *)camelFromUnderlineKey:(NSString *)underlineKey {
 return nil;
}


@end
