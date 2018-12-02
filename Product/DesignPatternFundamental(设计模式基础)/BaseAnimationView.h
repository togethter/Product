//
//  BaseAnimationView.h
//  Product
//
//  Created by 李学良 on 2018/10/24.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseAnimationView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSAttributedString *attributedTitle;

- (void)changeToNormalStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;


- (void)changeToDisableStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;

- (void)changeToHighlightStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;
@end

