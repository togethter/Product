//
//  XLTimer.h
//  ChongFa
//
//  Created by bilin on 2016/12/5.
//  Copyright © 2016年 lixueliang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XLTimer;

@protocol XLTimerDelegate <NSObject>
- (void)onXLTimerFired:(XLTimer *)holder;
@end
@interface XLTimer : NSObject
@property (nonatomic,weak)  id<XLTimerDelegate>  timerDelegate;

- (void)startTimer:(NSTimeInterval)seconds
          delegate:(id<XLTimerDelegate>)delegate
           repeats:(BOOL)repeats;
// 销毁
- (void)stopTimer;
// 暂停
- (void)suspended;
// 开始
- (void)start;

@end
