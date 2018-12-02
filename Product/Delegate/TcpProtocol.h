//
//  TcpProtocol.h
//  Product
//
//  Created by 李学良 on 2018/10/28.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TcpProtocol <NSObject>


@required
// 获取源端口
- (NSInteger)sourcePort;
// 获取目的端口号
- (NSInteger)destinationPort;
@end

