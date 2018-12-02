//
//  Game.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject

/**
 初始化游戏

 */
- (void)initGame;


/**
 暂停游戏
 */
- (void)pause;

/**
 游戏归档
 */
- (void)save;

/**
 退出游戏
 */
- (void)exitGame;


/**
 开始游戏
 */
- (void)startPlay;










@end

NS_ASSUME_NONNULL_END
