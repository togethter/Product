//
//  ChongFaApiProtocol.h
//  chongfa
//
//  Created by bilin on 2017/12/19.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChongFaApiModel.h"
typedef enum : NSUInteger {
    EchongFaTypeLogin,// 崇法登录
    EchongFaTypeCertification,// 认证
    EchongFaTypePickUpCase,// 结案
    EchongFaTypeOtherOperation,// 其他的操作我们不知道的一些操作
    
} EchongFaToDo;
@protocol ChongFaApiProtocol <NSObject>

@optional

/**
崇法旗下应用打开崇法去操作一些事情

 @param chongfaTodo 枚举 崇法登录 认证 结案
 @param responde 其他应用传递过来的参数
 */
- (void)onClicentAction:(EchongFaToDo)chongfaTodo onResponde:(id <ChongFaApiModelProtocol>)responde;

@end
