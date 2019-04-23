//
//  User.m
//  Product
//
//  Created by is on 2019/4/12.
//  Copyright © 2019 李学良. All rights reserved.
//

#import "User.h"
#import "Pets.h"
#import "WorkPricence.h"

@implementation User

- (void)initializeDefaultData {
  self.age = 10;
  self.name = @"hahah";
  self.icon = @"";
  self.height = 0;
  self.money = @(0);
  self.specialServerKeyFindModelKeyDic = @{@"aName":@"name",
                                           @"workPricence":@"workPricenceArray"
                                        };
  self.modelKeyOrArrayModelKeyDic = @{@"pets":@{classKey:NSStringFromClass(Pets.class),
                                                isModelArray:@"NO"},
                                      @"workPricenceArray":@{classKey:NSStringFromClass(WorkPricence.class),
                                                isModelArray:@"YES"}
                                      };
}


- (NSString *)camelFromUnderlineKey:(NSString *)underlineKey  {
  return [underlineKey mj_camelFromUnderline];
}

@end


