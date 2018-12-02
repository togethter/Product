//
//  LinkedList.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"


NS_ASSUME_NONNULL_BEGIN

@interface LinkedList : NSObject

/**
 节点头
 */
@property (nonatomic, strong, readonly) Node *headNode;

/**
 有几个节点
 */
@property (nonatomic, readonly) NSInteger numberOfNodes;


/**
 节点挂载的对象

 @param item 节点挂在的对象
 */
- (void)addItem:(id)item;


@end

NS_ASSUME_NONNULL_END
