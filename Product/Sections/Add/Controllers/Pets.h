//
//  Pets.h
//  Product
//
//  Created by is on 2019/4/22.
//  Copyright © 2019 李学良. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pets : BaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@end

NS_ASSUME_NONNULL_END
