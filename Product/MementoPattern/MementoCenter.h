//
//  MementoCenter.h
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MementoCenterProtocol.h"

@interface MementoCenter : NSObject


/**
 save the object state

 @param object object
 @param key key
 */
+ (void)saveMementoObject:(id <MementoCenterProtocol>)object withKey:(NSString *)key;

/**
 get the object state

 @param key key
 @return object
 */
+ (id)mementoObjectWithKey:(NSString *)key;


@end

