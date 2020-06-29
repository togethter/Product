//
//  XLChongfaApiImplementationProtocol.h
//  chongfa
//
//  Created by bilin on 2017/12/19.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChongFaApiModelProtocol.h"
@protocol XLChongfaApiImplementationProtocol <NSObject>



/**
 崇法其他的操作

 @param responde 崇法下棋传递过来的参数
 */
+ (void)XLChongfaApiImplementationEchongFaTypeOtherOperationResponde:(id<ChongFaApiModelProtocol>)responde withAppDelegate:(AppDelegate *)delegate;





@end
