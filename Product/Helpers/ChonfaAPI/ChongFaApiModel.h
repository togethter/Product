//
//  ChongFaApiModel.h
//  chongfa
//
//  Created by bilin on 2017/12/19.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChongFaApiModelProtocol.h"
@interface ChongFaApiModel : BaseModel<ChongFaApiModelProtocol>



/**
 这个是用短的index  跳转崇法下到哪一个tableBarController  index
 */
@property (nonatomic, copy) NSString *barindex;

/**
 律师端的index
 */
@property (nonatomic, copy) NSString *lawyindex;
/**
  要跳转到的崇法的试图空值器
 */
@property (nonatomic, copy) NSString *vc;

/**
 只有当userorlawyertype === 3 的情况才有值
 */
@property (nonatomic, copy) NSString *lawyervc;

/**
 返回打开崇法的应用程序
 */
@property (nonatomic, copy) NSString*openurl;


/**
 返回到原来的应用的 名字
 */
@property (nonatomic, copy) NSString *backoriginalappname;


/** 临时没有用
崇法端可能要隐藏的东西
 */
@property (nonatomic, copy) NSString *hiddensomesting;


/**
 跳到崇法的目的
 1崇法登录
 2认证
 3接案
 4其他的操作问题
 */
@property (nonatomic, copy) NSString *echongFaTostr;

/**
 其他应用跳转到崇法携带的参数 这个是备份的
 */
@property (nonatomic, strong) NSMutableDictionary *ExtensionParameters;


/**
 这个是将备份的分离出来我们想要的东西然后去跳转的
 */
@property (nonatomic, strong) NSMutableDictionary *networkParmeters;




@end
