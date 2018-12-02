//
//  NodeViewController.m
//  Product
//
//  Created by 李学良 on 2018/11/1.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "NodeViewController.h"
#import "LinkedList.h"
#import "LinkedListIterator.h"
@interface NodeViewController ()

@property (nonatomic, strong) LinkedList *linkedList;

@end

@implementation NodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSArray *datas = @[@"A",@"B",@"C",@"D"];
    NSEnumerator *iterator = [datas objectEnumerator];
    id arrayObj = nil;
    while (arrayObj = [iterator nextObject]) {
        NSLog(@"arrayObj");
    }
    
    
    self.linkedList = [[LinkedList alloc] init];
    [self.linkedList addItem:@"A"];
    [self.linkedList addItem:@"B"];
    [self.linkedList addItem:@"C"];
    [self.linkedList addItem:@"D"];
    NSLog(@"numberOfNodes = %ld",self.linkedList.numberOfNodes);
    Node *point = self.linkedList.headNode;
    do {
        NSLog(@"item -> %@", point.item);
    } while (point);
    
    
    
    LinkedListIterator *linkedIterator = [LinkedListIterator linkedListIteratorWithLinkedList:self.linkedList];
    Node *node = nil;
    while (node = [linkedIterator nextObject]) {
        NSLog(@"%@",node.item);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
