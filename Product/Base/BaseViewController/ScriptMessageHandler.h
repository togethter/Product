//
//  NHScriptMessageHandler.h
//  NianHua
//
//  Created by mgkj on 2019/6/13.
//  Copyright © 2019 NianHuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol ScriptMessageHandlerDelegate <NSObject>

/**
 WKWebView ->app交互

 @param message message
 */
- (void)scriptMessageHandler:(WKScriptMessage *)message;

@end
@interface ScriptMessageHandler : NSObject<WKScriptMessageHandler>
@property (nonatomic,weak)id<ScriptMessageHandlerDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
