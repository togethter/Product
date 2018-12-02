//
//  AbastractProxy.m
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "AbastractProxy.h"

#import "AbastractExcute.h"
#import <objc/runtime.h>
@implementation AbastractProxy


// 验证方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
   
    if ([self.delegate respondsToSelector:sel]) {
        return [self.delegate methodSignatureForSelector:sel];
    } else {
        AbastractExcute *excute = [AbastractExcute shareInstance];
        return [excute methodSignatureForSelector:NSSelectorFromString(@"nullExcute:")];
    }
}

//派发信息
- (void)forwardInvocation:(NSInvocation *)invocation {
    
    SEL selector = [invocation selector];
    if ([self.delegate respondsToSelector:selector]) {
        [invocation setTarget:self.delegate];
        [invocation invoke];
    } else {
        AbastractExcute *excute = [AbastractExcute shareInstance];
        NSString *selectorString = NSStringFromSelector(invocation.selector);
        invocation.selector = NSSelectorFromString(@"nullExcute:");
        [invocation setTarget:excute];
        const char *className = class_getName([self class]);
        NSArray *infos = nil;
        
        if (self.delegate) {
            infos = @[[NSString stringWithUTF8String:className],selectorString,@""];
        } else {
            infos = @[[NSString stringWithUTF8String:className],selectorString];
        }
        [invocation setArgument:&infos atIndex:2];
        [invocation invoke];
    }
}

@end

