//
//  XLTimer.m
//  ChongFa
//
//  Created by bilin on 2016/12/5.
//  Copyright © 2016年 lixueliang. All rights reserved.
//

#import "XLTimer.h"

@interface XLTimer ()
{
    NSTimer *_timer;
    BOOL    _repeats;
}

- (void)onTimer: (NSTimer *)timer;

@end

@implementation XLTimer


- (void)dealloc
{
    [self stopTimer];
}

- (void)startTimer: (NSTimeInterval)seconds
          delegate: (id<XLTimerDelegate>)delegate
           repeats: (BOOL)repeats
{
    _timerDelegate = delegate;
    _repeats = repeats;
    if (_timer)
    {
        [_timer invalidate];
        _timer = nil;
    }
    _timer = [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(onTimer:) userInfo:nil repeats:repeats];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [_timer invalidate];
    _timer = nil;
    _timerDelegate = nil;
}

- (void)suspended
{
    [_timer setFireDate:[NSDate distantFuture]];
}

- (void)start
{
    [_timer setFireDate:[NSDate distantPast]];
}

- (void)onTimer: (NSTimer *)timer
{
    if (!_repeats)
    {
        _timer = nil;
    }
    if (_timerDelegate && [_timerDelegate respondsToSelector:@selector(onXLTimerFired:)])
    {
        [_timerDelegate onXLTimerFired:self];
    }
}
@end
