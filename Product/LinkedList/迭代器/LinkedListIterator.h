//
//  LinkedListIterator.h
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"
#import "IteratorProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface LinkedListIterator : NSObject<IteratorProtocol>


/**
 便利构造器

 @param linkedList 链表
 @return 迭代器
 */
+ (instancetype)linkedListIteratorWithLinkedList:(LinkedList *)linkedList;
@end

NS_ASSUME_NONNULL_END
