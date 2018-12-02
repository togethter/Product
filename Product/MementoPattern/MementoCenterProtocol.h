//
//  MementoCenterProtocol.h
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MementoCenterProtocol <NSObject>


@required


/**
 get state

 @return state
 */
- (id)currentState;

/**
 recover from state

 @param state state
 */
- (void)recoverFromState:(id)state;

@end

NS_ASSUME_NONNULL_END
