//
//  FadeAnimationView.m
//  Product
//
//  Created by 李学良 on 2018/10/24.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "FadeAnimationView.h"

@implementation FadeAnimationView

- (void)fadeAnimated:(BOOL)animated
{
    //todo
}


- (void)changeToNormalStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration {
    [self fadeAnimated:animated];
}
- (void)changeToDisableStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration {
    // todo
}

- (void)changeToHighlightStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration {
      // todo
}
@end
