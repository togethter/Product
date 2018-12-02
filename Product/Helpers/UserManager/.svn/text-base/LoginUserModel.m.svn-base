//
//  UserModel.m
//  LvJie
//
//  Created by bilin on 2017/1/5.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import "LoginUserModel.h"

#define loginUid @"uid"
#define loginNickName @"nickname"
#define loginToken @"token"
#define loginAccid @"accid"
#define loginUserType @"usertype"
#define loginUsertips @"usertips"
#define loginStatus @"status"
#define loginlawyer_status @"lawyer_status"
#define loginVip @"vip"
#define loginBan @"ban"
#define loginUpdateLatLngTime @"updateLatLngTime"//avatar
#define loginavatar @"avatar"
#define loginlawyer_speciality @"lawyer_speciality"
#define loginlawyer_office @"lawyer_office"
#define loginban_info @"ban_info"




@implementation LoginUserModel


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.uid forKey:loginUid];
    [aCoder encodeObject:self.nickname forKey:loginNickName];
    [aCoder encodeObject:self.token forKey:loginToken];
    [aCoder encodeObject:self.accid forKey:loginAccid];
    [aCoder encodeObject:self.usertype forKey:loginUserType];
    [aCoder encodeObject:self.usertips forKey:loginUsertips];
    [aCoder encodeObject:self.status forKey:loginStatus];
    [aCoder encodeObject:self.lawyer_status forKey:loginlawyer_status];
    [aCoder encodeObject:self.vip forKey:loginVip];
    [aCoder encodeObject:self.ban forKey:loginBan];
    [aCoder encodeObject:self.updateLatLngTime forKey:loginUpdateLatLngTime];
    [aCoder encodeObject:self.avatar forKey:loginavatar];
    [aCoder encodeObject:self.lawyer_speciality forKey:loginlawyer_speciality];
    [aCoder encodeObject:self.lawyer_office forKey:loginlawyer_office];
    [aCoder encodeObject:self.ban_info forKey:loginban_info];
    

}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.uid = [aDecoder decodeObjectForKey:loginUid];
        self.nickname = [aDecoder decodeObjectForKey:loginNickName];
        self.token = [aDecoder decodeObjectForKey:loginToken];
        self.accid = [aDecoder decodeObjectForKey:loginAccid];
        self.usertype = [aDecoder decodeObjectForKey:loginUserType];
        self.usertips = [aDecoder decodeObjectForKey:loginUsertips];
        self.status = [aDecoder decodeObjectForKey:loginStatus];
        self.lawyer_status = [aDecoder decodeObjectForKey:loginlawyer_status];
        self.vip = [aDecoder decodeObjectForKey:loginVip];
        self.ban = [aDecoder decodeObjectForKey:loginBan];
        self.updateLatLngTime = [aDecoder decodeObjectForKey:loginUpdateLatLngTime];
        self.avatar = [aDecoder decodeObjectForKey:loginavatar];
        self.lawyer_office = [aDecoder decodeObjectForKey:loginlawyer_office];
        self.lawyer_speciality = [aDecoder decodeObjectForKey:loginlawyer_speciality];
        self.ban_info  = [aDecoder decodeObjectForKey:loginban_info];
    }
    return self;
}

@end
