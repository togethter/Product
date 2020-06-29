//
//  NHScriptMessageHandler.m
//  NianHua
//
//  Created by mgkj on 2019/6/13.
//  Copyright © 2019 NianHuan. All rights reserved.
//

#import "ScriptMessageHandler.h"

@implementation ScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if (self.delegate && [self.delegate respondsToSelector:@selector(scriptMessageHandler:)]) {
        [self.delegate scriptMessageHandler:message];
    }
}
@end
