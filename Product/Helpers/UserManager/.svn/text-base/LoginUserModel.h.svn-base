//
//  UserModel.h
//  LvJie
//
//  Created by bilin on 2017/1/5.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//
/** 时间戳*/
//@property (nonatomic, copy) NSString *timeStamp;//time_t now;
// time(&now);
//    NSLog(@"%@", [NSString stringWithFormat:@"%ld", now]);
#import "BaseModel.h"

@interface LoginUserModel : BaseModel<NSCoding>
@property (nonatomic, copy) NSString *uid;// 3.0新版
@property (nonatomic, copy) NSString *nickname;// 3.0 新版 用户的名字
@property (nonatomic, copy) NSString *token;// 3.0新版
@property (nonatomic, copy) NSString *accid;// 3.0新版
@property (nonatomic, copy) NSString *usertype;// 3.0新版 用户类型1用户2律师
@property (nonatomic, copy) NSString *usertips;//3.0 新版 1显示2不显示
@property (nonatomic, copy) NSString *status;// 3.0新版 用户状态1正常2冻结
@property (nonatomic, copy) NSString *lawyer_status;// 3.0 律师状态 1未审核2审核中3已审核4审核失败
@property (nonatomic, copy) NSString *vip;// 3.0 1不是推荐2推荐
@property (nonatomic, copy) NSString *ban;//3.0 新版 是否禁言1未禁言2禁言
@property (nonatomic, copy) NSString *ban_info;//3.0 禁言提示如果为空显示我们默认的东西如果不为空的话显示服务器的先返回的东西
@property (nonatomic, copy) NSString *updateLatLngTime; // 3.0跟新经纬度时间
/**
 *头像 律师端 案源详情需要
 */
@property (nonatomic, copy) NSString * avatar; // 3.0

/**
 *擅长领域
 */
@property (nonatomic, copy) NSMutableArray * lawyer_speciality; // 3.0

/**
 *律所名
 */
@property (nonatomic, copy) NSString * lawyer_office; // 3.0




@end
