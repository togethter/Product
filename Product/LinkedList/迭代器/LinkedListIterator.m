//
//  LinkedListIterator.m
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "LinkedListIterator.h"

@interface LinkedListIterator ()
@property (nonatomic, strong) LinkedList *linedList;
@property (nonatomic, strong) Node       *currentNode;

@end
@implementation LinkedListIterator
+ (instancetype)linkedListIteratorWithLinkedList:(LinkedList *)linkedList {
    LinkedListIterator *linkedIterator = [LinkedListIterator new];
    linkedIterator.linedList  = linkedList;
    linkedIterator.currentNode = linkedList.headNode;
    return linkedIterator;
}


- (id)nextObject {
    self.currentNode = self.currentNode.nextNode;
    return self.currentNode;
}
@end
