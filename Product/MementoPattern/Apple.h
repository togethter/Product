//
//  Apple.h
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MementoCenterProtocol.h"

@interface Apple : NSObject<MementoCenterProtocol>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@end

