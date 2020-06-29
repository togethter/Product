//
//  BaseWebViewController.h
//  Product
//
//  Created by GD on 2020/6/29.
//  Copyright © 2020 李学良. All rights reserved.
//

#import "BaseViewController.h"
#import "ScriptMessageHandler.h"
#import "YLProgressBar.h"
NS_ASSUME_NONNULL_BEGIN

@protocol WebViewDelegate <NSObject>

- (void)scriptMessageHandler:(WKScriptMessage *)message;
@end
@interface BaseWebViewController : BaseViewController<WKUIDelegate, WKNavigationDelegate,ScriptMessageHandlerDelegate>

@property (nonatomic, strong) WKWebView *webView;
/** url / html */
@property (nonatomic,copy) NSString *url, *html;
// 用于JS 交互
@property (nonatomic, strong) NSArray *messageNameArray;
@property (nonatomic,weak) id<WebViewDelegate>delegate;
@property (strong, nonatomic) YLProgressBar *progressView;
/**是否打印webView信息 */
@property (nonatomic, assign) BOOL canConsoleLogs;

@end

NS_ASSUME_NONNULL_END
