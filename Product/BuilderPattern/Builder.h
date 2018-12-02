//
//  Builder.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuilderProtocol.h"
#import "AbstractEngine.h"
#import "AbstractWheels.h"
#import "AbstractDoor.h"

NS_ASSUME_NONNULL_BEGIN

@interface Builder : NSObject

@property (nonatomic, strong) id<BuilderProtocol,AbstractEngine> engine;
@property (nonatomic, strong) id<BuilderProtocol,AbstractWheels> wheels;
@property (nonatomic, strong) id<BuilderProtocol,AbstractDoor>   door;

@property (nonatomic, strong) NSDictionary *prodocutsInfo;

- (void)buildAllParts;

@end

NS_ASSUME_NONNULL_END
