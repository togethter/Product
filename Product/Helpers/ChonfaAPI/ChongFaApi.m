//
//  ChongFaApi.m
//  chongfa
//
//  Created by bilin on 2017/12/19.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import "ChongFaApi.h"
#import "ChongFaApiModel.h"
@implementation ChongFaApi

+ (BOOL)handleOpenURL:(NSURL *)url delegate:(id<ChongFaApiProtocol>)delegate
{
    
    NSURL *parmaterUrl = url;
    NSString *urlpath = parmaterUrl.query;// 参数
    NSArray *array = [urlpath componentsSeparatedByString:@"&"];// 分割参数
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSString *keyvalue in array) {
        NSArray *keyValueArray = [keyvalue componentsSeparatedByString:@"="];
        if (IS_VALID_ARRAY(keyValueArray) && keyValueArray.count==2) {
            [dic setValue:keyValueArray.lastObject forKey:keyValueArray.firstObject];
        }
    }
//    NSLog(@"%@",dic);
    if (IS_VALID_ARRAY(array)) {
        if (dic && dic.count >=2) {
            ChongFaApiModel *model = [ChongFaApiModel loadModelWithDictionary:dic];// 这样就证明我们传进来想要的参数了
            if ([delegate respondsToSelector:@selector(onClicentAction:onResponde:)]) {
                if (IS_VALID_STRING(model.echongFaTostr)) {
                   if ([model.echongFaTostr isEqualToString:@"4"]) {// 如果是4的就是自定义的一些操作
                        [delegate onClicentAction:EchongFaTypeOtherOperation onResponde:model];
                       
                    }
                }
            }
        }
        
    }
    
    return YES;
    
}



@end
