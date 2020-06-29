//
//  BaseWebViewController.m
//  Product
//
//  Created by GD on 2020/6/29.
//  Copyright © 2020 李学良. All rights reserved.
//

#import "BaseWebViewController.h"

@implementation BaseWebViewController
/**
 WKWebView ->app交互
 
 @param message message
 */
- (void)scriptMessageHandler:(WKScriptMessage *)message {
    DLog(@"%@,%@",message.name,message.body);
    if (self.delegate && [self.delegate respondsToSelector:@selector(scriptMessageHandler:)]) {
        [self.delegate scriptMessageHandler:message];
    }
    
}


/**
 打印wkWebView的console.log
 
 @param userContentController WKUserContentController
 */
- (void)showConsole:(WKUserContentController *)userContentController {
    
    //rewrite the method of console.log
    NSString *jsCode = @"console.log = (function(oriLogFunc){\
    return function(str)\
    {\
    window.webkit.messageHandlers.log.postMessage(str);\
    oriLogFunc.call(console,str);\
    }\
    })(console.log);";
    ScriptMessageHandler *handler = [[ScriptMessageHandler alloc] init];
    handler.delegate  = self;
    [userContentController addScriptMessageHandler:handler name:@"log"];
    [userContentController addUserScript:[[WKUserScript alloc] initWithSource:jsCode injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES]];
}

- (WKWebViewConfiguration *)confi {
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
    WKWebViewConfiguration *confi = [[WKWebViewConfiguration alloc] init];
    for (NSString *name in self.messageNameArray) {
        ScriptMessageHandler *messageHandler = [[ScriptMessageHandler alloc] init];
        messageHandler.delegate = self;
        [userContentController addScriptMessageHandler:messageHandler name:name];
    }
    if (self.canConsoleLogs) {
        [self showConsole:userContentController];
    }
    confi.userContentController = userContentController;
    return confi;
}
- (YLProgressBar *)progressView {
    if (!_progressView) {
        _progressView = [[YLProgressBar alloc]initWithFrame:CGRectMake(0,64-2, kScreenWidth, 2)];
        NSArray *tintColors = @[[UIColor redColor],[UIColor greenColor]];
        _progressView.progressTintColors = tintColors;
        _progressView.type   = YLProgressBarTypeFlat;
        _progressView.hideStripes        = YES;
        _progressView.hideTrack          = YES;
        _progressView.behavior           = YLProgressBarBehaviorDefault;
        [self.navigationController.navigationBar addSubview: _progressView];
    }
    return _progressView;
}
- (WKWebView *)webView {
    if (!_webView) {
        _webView  = [[WKWebView alloc]initWithFrame:CGRectZero configuration:self.confi];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
    }
    return _webView;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.progressView removeFromSuperview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.url) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    }
    if (self.html) {
        [self.webView loadHTMLString:self.html baseURL:nil];
    }
}


- (void)configUI {
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)configNavigationBar {
    [super configNavigationBar];
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [self.progressView setProgress:1 animated:YES];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1  * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        self.progressView.backgroundColor = [UIColor clearColor];
        [self.progressView removeFromSuperview];
    });
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    [self.progressView setProgress:1 animated:YES];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1  * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        self.progressView.backgroundColor = [UIColor clearColor];
        [self.progressView removeFromSuperview];
    });
}


- (void)clearWebViewCache {
    
    NSArray * types =@[WKWebsiteDataTypeMemoryCache,WKWebsiteDataTypeDiskCache]; // 9.0之后才有的
    NSSet *websiteDataTypes = [NSSet setWithArray:types];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        
    }];
}
- (void)dealloc {
    [self clearWebViewCache];
}
- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    if (!navigationAction.targetFrame.isMainFrame) {
        
        [webView loadRequest:navigationAction.request];
        
    }
    
    return nil;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // NOTE: ------  对alipays:相关的scheme处理 -------
    // NOTE: 若遇到支付宝相关scheme，则跳转到本地支付宝App
    NSString* reqUrl = request.URL.absoluteString;
    if ([reqUrl hasPrefix:@"alipays://"] || [reqUrl hasPrefix:@"alipay://"]) {
        // NOTE: 跳转支付宝App
        BOOL bSucc = [[UIApplication sharedApplication]openURL:request.URL];
        
        // NOTE: 如果跳转失败，则跳转itune下载支付宝App
        if (!bSucc) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                           message:@"未检测到支付宝客户端，请安装后重试。"
                                                          delegate:self
                                                 cancelButtonTitle:@"立即安装"
                                                 otherButtonTitles:nil];
            [alert show];
        }
        return NO;
    }
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // NOTE: 跳转itune下载支付宝App
    NSString* urlStr = @"https://itunes.apple.com/cn/app/zhi-fu-bao-qian-bao-yu-e-bao/id333206289?mt=8";
    NSURL *downloadUrl = [NSURL URLWithString:urlStr];
    [[UIApplication sharedApplication]openURL:downloadUrl];
}
@end
