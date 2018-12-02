//
//  XLChongFaApiCenter.m
//  chongfa
//
//  Created by bilin on 2017/12/19.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import "XLChongFaApiCenter.h"
#import "XLChongfaApiImplementaionOne.h"
@implementation XLChongFaApiCenter
+ (void)chongFaApiCenterAction:(EchongFaToDo)chongfaTodo onResponde:(id <ChongFaApiModelProtocol>)responde withDelegate:(XLAppDelegate *)delegate
{
    switch (chongfaTodo) {
       
        case EchongFaTypeOtherOperation:// 崇法的一些其他的操作
        {
            [XLChongfaApiImplementaionOne  XLChongfaApiImplementationEchongFaTypeOtherOperationResponde:responde withAppDelegate:delegate];
        }
            
            break;
        default:
            break;
    }
}

@end
