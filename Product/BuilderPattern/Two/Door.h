//
//  Door.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractDoor.h"
#import "BuilderProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Door : NSObject<AbstractDoor,BuilderProtocol>

@end

NS_ASSUME_NONNULL_END
