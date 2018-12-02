//
//  AbstractPartTwo.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AbstractPartTwo <NSObject>

@required
- (void)buildTree;
- (void)buildSoureWithNumber;
@end

NS_ASSUME_NONNULL_END
