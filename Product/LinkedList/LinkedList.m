//
//  LinkedList.m
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "LinkedList.h"
@interface LinkedList ()
@property (nonatomic, strong) Node *headNode;

@property (nonatomic) NSInteger numberOfNodes;

@end

@implementation LinkedList


- (void)addItem:(id)item {
    if (self.headNode == nil) {
        self.headNode = [Node nodeWithItem:item];
    } else {
        [self addItem:item node:self.headNode];
    }
    self.numberOfNodes++;
}

#pragma mark - 私有方法
- (void)addItem:(id)item node:(Node *)node {
    if (node.nextNode == nil) {
        node.nextNode = [Node nodeWithItem:item];
    } else {
        [self addItem:item node:node.nextNode];
    }
}

@end
