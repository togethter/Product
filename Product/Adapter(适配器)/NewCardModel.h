//
//  NewCardModel.h
//  Product
//
//  Created by 李学良 on 2018/10/24.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewCardModel : NSObject

/**
 *  名字
 */
@property (nonatomic, strong) NSString *name;

/**
 *  线条颜色
 */
@property (nonatomic, strong) NSString *colorHexString;

/**
 *  电话号码
 */
@property (nonatomic, strong) NSString *phoneNumber;

@end

