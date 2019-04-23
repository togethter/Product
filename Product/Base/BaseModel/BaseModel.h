//
//  BaseModel.h
//  ChongFa
//
//  Created by bilin on 2016/12/5.
//  Copyright © 2016年 lixueliang. All rights reserved.
//  服务器给模型中的字符串下发的数据如果是数字类型，会自动转换成NSNumber 这样如果直接给lable赋值会崩溃的
//  所以讲NSNumber转成字符串
//  服务器给模型中的基本类型下发的数据如果是字符串类型，会自动转换成该基本类型
//  将服务器的NSNumber转成字符串后在给NSUInteger 赋值的话 会造成 -[NSTaggedPointerString unsignedLongLongValue]: unrecognized selector sent to instance 针对崩溃原因给字符串写一个方法 unsignedLongLongValue解决崩溃问题


#import <Foundation/Foundation.h>

#ifndef NSStringExtension
#import "NSString+Extension.h"
#endif

extern NSString *const classKey;
extern NSString *const isModelArray;

@interface BaseModel : NSObject
/** key-服务器的key, value- 模型中新自定义的key 通过将服务器的key替换成模型中的key去给模型赋值*/
@property (nonatomic, strong, nullable) NSDictionary *specialServerKeyFindModelKeyDic;
/**
 modelKeyOrArrayModelKeyDic: 为空代表模型中不会嵌套模型
 key-模型中的key value- 字典:{@"classKey":ClassStr,@"isArray:@(YES)"}
  classKey值存在&&isArray为空或者NO 代表是模型中嵌套 'ClassStr' 模型
  classKey值存在&&isArray为YES 代表是模型中嵌套数组 'ClassStr'模型
 */
@property (nonatomic, strong, nullable) NSDictionary *modelKeyOrArrayModelKeyDic;

/** 对象 初始化方法*/
- (instancetype)initWithDictionary:(NSDictionary *)dic;
/** 类 初始化方法*/
+ (instancetype)loadModelWithDictionary:(NSDictionary *)dic;
/** 初始化默认数据 子类重写可以配置默认数据*/
- (void)initializeDefaultData;

/**下划线转驼峰（love_you -> loveYou）*/
- (NSString *)camelFromUnderlineKey:(NSString *)underlineKey;

@end
