//
//  User.h
//  Product
//
//  Created by is on 2019/4/12.
//  Copyright © 2019 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    SexMale,
    SexFemale
} Sex;
NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
@property (assign, nonatomic) unsigned int age;
@property (copy, nonatomic) NSString *height;
@property (strong, nonatomic) NSNumber *money;
@property (assign, nonatomic) Sex sex;
@property (assign, nonatomic, getter=isGay) BOOL gay;
@end

NS_ASSUME_NONNULL_END
