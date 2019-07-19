//
//  TalkViewController.m
//  Product
//
//  Created by is on 2019/4/24.
//  Copyright © 2019 李学良. All rights reserved.
//

#import "TalkViewController.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "AdapterViewController.h"
@interface TalkViewController ()

@property (nonatomic, strong) UIView* topView;
@property (nonatomic, strong) UIView* bottomView;
@property (nonatomic, strong) UIImageView*  imageView;
@end

@implementation TalkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//  http://test.clientconfig.ispeak.cn/dbapi/package/2.20001mtips.gif
  self.imageView = [[UIImageView alloc] init];
  self.view.backgroundColor = [UIColor whiteColor];
  [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://test.clientconfig.ispeak.cn/dbapi/package/2.20001mtips.gif"]];


  self.topView = [[UIView alloc] init];
  self.bottomView = [[UIView alloc] init];
  [self.bottomView addSubview:self.imageView];

  [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.mas_equalTo(self.bottomView);
  }];
  [self.view addSubview:self.topView];
  [self.view addSubview:self.bottomView];
  self.topView.backgroundColor = [UIColor redColor];
  self.bottomView.backgroundColor = [UIColor yellowColor];
  UILabel *name = [UILabel new];
  name.text = @"张三";
  [self.topView addSubview:name];
  [name mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(self.topView.mas_left);
    make.centerY.mas_equalTo(self.topView.mas_centerY);
  }];
  [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(self.view.mas_top).offset(64);
    make.left.mas_equalTo(self.view.mas_left);
    make.right.mas_equalTo(self.view.mas_right);
    make.bottom.mas_equalTo(self.bottomView.mas_top);
  }];
  
  [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.mas_equalTo(self.view.mas_bottom);
    make.left.mas_equalTo(self.view.mas_left);
    make.right.mas_equalTo(self.view.mas_right);
    make.height.mas_equalTo(300);
  }];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)pushAction:(UIButton *)btn {
    AdapterViewController *vc = [[AdapterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)orientationDidChange:(NSNotification *)center  {
  switch ([UIDevice currentDevice].orientation) {
    case UIDeviceOrientationLandscapeLeft:
    case UIDeviceOrientationLandscapeRight:
    {
      NSLog(@"UIDeviceOrientationLandscapeLeft");

      [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0);
      }];
      [self.imageView removeFromSuperview];
      [self.topView addSubview:self.imageView];
      [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.topView);
      }];
         break;
    }
      
      case UIDeviceOrientationUnknown:
      case UIDeviceOrientationPortrait:
    {
      NSLog(@"UIDeviceOrientationPortrait");
      [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(300);
      }];
      [self.imageView removeFromSuperview];
      [self.bottomView addSubview:self.imageView];
      [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.bottomView);
      }];
      break;
    }
    default:
      break;
  }

}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
  return UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationLandscapeRight;
}

// 默认方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
  return UIInterfaceOrientationPortrait; // 或者其他值 balabala~
}

// 开启自动转屏
- (BOOL)shouldAutorotate {
  return YES;
}
//另一种是我们在项目中的某些条件下强行让屏幕横屏，
//例如大图预览，视频播放，等等。而对于这种情况，我们可以使用下面👇这两种方法，都可以实现效果：
//- (void)setInterfaceOrientation:(UIInterfaceOrientation)orientation {
//  if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
//    SEL selector = NSSelectorFromString(@"setOrientation:");
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
//    [invocation setSelector:selector];
//    [invocation setTarget:[UIDevice currentDevice]];
//    int val = orientation;
//    [invocation setArgument:&val atIndex:2];
//    [invocation invoke];
//  }
//}

//- (void)setInterfaceOrientation:(UIDeviceOrientation)orientation {
//  if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
//    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:orientation] forKey:@"orientation"];
//  }
//}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
  
  if (size.width > size.height) { // 横屏
    // 横屏布局 balabala
    NSLog(@"s");
  } else {
    // 竖屏布局 balabala
    
    NSLog(@"h");
  }
}

//- (void)layoutSubviews {
//  [super layoutSubviews];
//  // 通过状态栏电池图标来判断屏幕方向
//  if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationMaskPortrait) {
//    // 竖屏 balabala
//  } else {
//    // 横屏 balabala
//  }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
