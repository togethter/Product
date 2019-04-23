//
//  User.h
//  Product
//
//  Created by is on 2019/4/12.
//  Copyright © 2019 李学良. All rights reserved.
//

#import "BaseModel.h"
@class Pets,WorkPricence;
typedef enum {
    SexMale,
    SexFemale
} Sex;
NS_ASSUME_NONNULL_BEGIN

@interface User : BaseModel
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
@property (assign, nonatomic) NSUInteger age;
@property (assign, nonatomic) CGFloat height;
@property (strong, nonatomic) NSNumber *money;
@property (assign, nonatomic) Sex sex;
@property (assign, nonatomic, getter=isGay) BOOL gay;
@property (nonatomic, strong,nullable) Pets *pets;
@property (nonatomic, strong, nullable) NSArray<WorkPricence *> *workPricenceArray;
@end

NS_ASSUME_NONNULL_END
