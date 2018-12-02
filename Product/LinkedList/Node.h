//
//  Node.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

/**
 指向下一个节点
 */
@property (nonatomic, strong) Node *nextNode;

/**
 节点挂在对象
 */
@property (nonatomic, strong) id    item;


/**
 便利构造器

 @param item 节点挂载的对象
 @return Node对象
 */
+ (instancetype)nodeWithItem:(id)item;


@end

NS_ASSUME_NONNULL_END
