//
//
//
//
//  Created by lbxia on 15/10/21.
//  Copyright © 2015年 lbxia. All rights reserved.
//

#import "QQLBXScanViewController.h"
#import "CreateBarCodeViewController.h"
#import "LBXScanVideoZoomView.h"
#import "LBXPermission.h"
#import "LBXPermissionSetting.h"
@interface QQLBXScanViewController ()
@property (nonatomic, strong) LBXScanVideoZoomView *zoomView;
@end

@implementation QQLBXScanViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.title = @"二维码";
    //设置扫码后需要扫码图像
    self.isNeedScanImage = YES;
    [self creatLeftItem];
   
    
}

-(void)creatLeftItem{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,44,44)];
    view.backgroundColor = [UIColor clearColor];
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(0, 0, 44, 44);
    [firstButton setImage:[[UIImage imageNamed:@"btn_fanhui"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [firstButton addTarget:self action:@selector(xlBackActionshangxin) forControlEvents:UIControlEventTouchUpInside];
    firstButton.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5,0,0)];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:firstButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
}

-(void)xlBackActionshangxin{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
    [self drawBottomItems];
    [self drawTitle];
    [self.view bringSubviewToFront:_topTitle];
    
    
}

//绘制扫描区域
- (void)drawTitle
{
    if (!_topTitle)
    {
        self.topTitle = [[UILabel alloc]init];
        _topTitle.bounds = CGRectMake(0, 0, 145, 60);
        _topTitle.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, 50);
        
        //3.5inch iphone
        if ([UIScreen mainScreen].bounds.size.height <= 568 )
        {
            _topTitle.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, 38);
            _topTitle.font = [UIFont systemFontOfSize:14];
        }
        
        
        _topTitle.textAlignment = NSTextAlignmentCenter;
        _topTitle.numberOfLines = 0;
        _topTitle.text = @"将取景框对准二维码即可自动扫描";
        _topTitle.textColor = [UIColor whiteColor];
        [self.view addSubview:_topTitle];
    }    
}

- (void)cameraInitOver
{
    if (self.isVideoZoom) {
        [self zoomView];
    }
}

- (LBXScanVideoZoomView*)zoomView
{
    if (!_zoomView)
    {
      
        CGRect frame = self.view.frame;
        
        int XRetangleLeft = self.style.xScanRetangleOffset;
        
        CGSize sizeRetangle = CGSizeMake(frame.size.width - XRetangleLeft*2, frame.size.width - XRetangleLeft*2);
        
        if (self.style.whRatio != 1)
        {
            CGFloat w = sizeRetangle.width;
            CGFloat h = w / self.style.whRatio;
            
            NSInteger hInt = (NSInteger)h;
            h  = hInt;
            
            sizeRetangle = CGSizeMake(w, h);
        }
        
        CGFloat videoMaxScale = [self.scanObj getVideoMaxScale];
        
        //扫码区域Y轴最小坐标
        CGFloat YMinRetangle = frame.size.height / 2.0 - sizeRetangle.height/2.0 - self.style.centerUpOffset;
        CGFloat YMaxRetangle = YMinRetangle + sizeRetangle.height;
        
        CGFloat zoomw = sizeRetangle.width + 40;
        _zoomView = [[LBXScanVideoZoomView alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-zoomw)/2, YMaxRetangle + 40, zoomw, 18)];
        
        [_zoomView setMaximunValue:videoMaxScale/4];
        
        
        __weak __typeof(self) weakSelf = self;
        _zoomView.block= ^(float value)
        {            
            [weakSelf.scanObj setVideoScale:value];
        };
        [self.view addSubview:_zoomView];
                
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [self.view addGestureRecognizer:tap];
    }
    
    return _zoomView;
   
}

- (void)tap
{
    _zoomView.hidden = !_zoomView.hidden;
}

- (void)drawBottomItems
{
    if (_bottomItemsView) {
        
        return;
    }
    if (iPhoneX) {
        
        self.bottomItemsView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame)-164-IPhoneXBottomV*2,
                                                                       CGRectGetWidth(self.view.frame), 100+IPhoneXBottomV+7)];
    }else{
        self.bottomItemsView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame)-164,
                                                                       CGRectGetWidth(self.view.frame), 100)];
    }
    
    _bottomItemsView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    [self.view addSubview:_bottomItemsView];
    
    CGSize size = CGSizeMake(65, 87);
    self.btnFlash = [[UIButton alloc]init];
    _btnFlash.bounds = CGRectMake(0, 0, size.width, size.height);
    _btnFlash.center = CGPointMake(CGRectGetWidth(_bottomItemsView.frame)/1.5, CGRectGetHeight(_bottomItemsView.frame)/2);
     [_btnFlash setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_flash_nor"] forState:UIControlStateNormal];
    [_btnFlash addTarget:self action:@selector(openOrCloseFlash) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnPhoto = [[UIButton alloc]init];
    _btnPhoto.bounds = _btnFlash.bounds;
    _btnPhoto.center = CGPointMake(CGRectGetWidth(_bottomItemsView.frame)/3, CGRectGetHeight(_bottomItemsView.frame)/2);
    [_btnPhoto setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_photo_nor"] forState:UIControlStateNormal];
    [_btnPhoto setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_photo_down"] forState:UIControlStateHighlighted];
    [_btnPhoto addTarget:self action:@selector(openPhoto) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnMyQR = [[UIButton alloc]init];
    _btnMyQR.bounds = _btnFlash.bounds;
    _btnMyQR.center = CGPointMake(CGRectGetWidth(_bottomItemsView.frame) * 3/4, CGRectGetHeight(_bottomItemsView.frame)/2);
    [_btnMyQR setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_myqrcode_nor"] forState:UIControlStateNormal];
    [_btnMyQR setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_myqrcode_down"] forState:UIControlStateHighlighted];
    [_btnMyQR addTarget:self action:@selector(myQRCode) forControlEvents:UIControlEventTouchUpInside];
    
    [_bottomItemsView addSubview:_btnFlash];
    [_bottomItemsView addSubview:_btnPhoto];
//    [_bottomItemsView addSubview:_btnMyQR];
    
}

- (void)showError:(NSString*)str
{
    [LBXAlertAction showAlertWithTitle:@"提示" msg:str buttonsStatement:@[@"知道了"] chooseBlock:nil];
    
    
}

- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    if (array.count < 1)
    {
        [self popAlertMsgWithScanResult:nil];
     
        return;
    }
    
    //经测试，可以同时识别2个二维码，不能同时识别二维码和条形码
    for (LBXScanResult *result in array) {
        
        DLog(@"scanResult:%@",result.strScanned);
    }
    
    LBXScanResult *scanResult = array[0];
    
    NSString*strResult = scanResult.strScanned;
    
    self.scanImage = scanResult.imgScanned;
    
    if (!strResult) {
        
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    //震动提醒
//    [LBXScanWrapper systemVibrate];
    //声音提醒
//    [LBXScanWrapper systemSound];
    
    [self showNextVCWithScanResult:scanResult];
   
}

- (void)popAlertMsgWithScanResult:(NSString*)strResult
{
    if (!strResult) {
        
        strResult = @"识别失败";
    }
    
    __weak __typeof(self) weakSelf = self;
    [LBXAlertAction showAlertWithTitle:@"扫码内容" msg:strResult buttonsStatement:@[@"知道了"] chooseBlock:^(NSInteger buttonIdx) {

        [weakSelf reStartDevice];  
    }];
}

- (void)showNextVCWithScanResult:(LBXScanResult*)strResult
{
    if (IS_VALID_STRING(strResult.strScanned)) {
        
        NSString * urlStr = strResult.strScanned;
        NSDictionary * dic = [self getURLParameters:urlStr];
        DLog(@"%@",dic);
      
        
    }else{
        
//        [GiFHUD show:@"二维码有误,识别失败~" view:self.view];
    }
    
    
}


#pragma mark -底部功能项
//打开相册
- (void)openPhoto
{
    __weak __typeof(self) weakSelf = self;
    [LBXPermission authorizeWithType:LBXPermissionType_Photos completion:^(BOOL granted, BOOL firstTime) {
        if (granted) {
            [weakSelf openLocalPhoto:NO];
        }
        else if (!firstTime )
        {
            [LBXPermissionSetting showAlertToDislayPrivacySettingWithTitle:@"提示" msg:@"没有相册权限，是否前往设置" cancel:@"取消" setting:@"设置"];
        }
    }];
}

//开关闪光灯
- (void)openOrCloseFlash
{
    [super openOrCloseFlash];
   
    if (self.isOpenFlash)
    {
        [_btnFlash setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_flash_down"] forState:UIControlStateNormal];
    }
    else
        [_btnFlash setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_flash_nor"] forState:UIControlStateNormal];
}


#pragma mark -底部功能项


- (void)myQRCode
{
    CreateBarCodeViewController *vc = [CreateBarCodeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSMutableDictionary*)getURLParameters:(NSString *)url {
    
    NSRange  range = [url  rangeOfString:@"?"];
    
    if(range.location==NSNotFound) {
        
        return  nil;
        
    }
    
    NSMutableDictionary  *params = [NSMutableDictionary   dictionary];
    
    NSString  *parametersString = [url    substringFromIndex:range.location+1];
    
    if([parametersString   containsString:@"&"]) {
        
        NSArray  *urlComponents = [parametersString   componentsSeparatedByString:@"&"];
        
        for(NSString *keyValuePair in urlComponents) {
            
            //生成key/value
            
            NSArray *pairComponents = [keyValuePair  componentsSeparatedByString:@"="];
            
            NSString *key = [pairComponents.firstObject  stringByRemovingPercentEncoding];
            
            NSString*value = [pairComponents.lastObject  stringByRemovingPercentEncoding];
            
            //key不能为nil
            
            if(key==nil|| value ==nil) {
                
                continue;
                
            }
            
            id existValue = [params valueForKey:key];
            
            if(existValue !=nil) {
                
                //已存在的值，生成数组。
                
                if([existValue  isKindOfClass:[NSArray  class]]) {
                    
                    //已存在的值生成数组
                    
                    NSMutableArray*items = [NSMutableArray arrayWithArray:existValue];
                    
                    [items addObject:value];
                    
                    [params setValue:items forKey:key];
                    
                }else{
                    
                    //非数组
                    
                    [params setValue:@[existValue,value]forKey:key];
                    
                }
                
            }else{
                
                //设置值
                
                [params setValue:value forKey:key];
                
            }
            
        }
        
    }else{
        
        //单个参数生成key/value
        
        NSArray *pairComponents = [parametersString  componentsSeparatedByString:@"="];
        
        if(pairComponents.count==1) {
            
            return nil;
            
        }
        
        //分隔值
        
        NSString *key = [pairComponents.firstObject  stringByRemovingPercentEncoding];
        
        NSString *value = [pairComponents.lastObject  stringByRemovingPercentEncoding];
        
        //key不能为nil
        
        if(key ==nil|| value ==nil) {
            
            return nil;
            
        }
        
        //设置值
        
        [params setValue:value forKey:key];
        
    }
    
    return params;
    
}



@end
