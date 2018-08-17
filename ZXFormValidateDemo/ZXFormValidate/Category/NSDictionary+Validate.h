//
//  NSDictionary+Validate.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/16.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Validate)
///根据keysArr获取当前字典第一个属性为空的index 找不到则返回-1
-(int)getNullIndexWithKeysArr:(NSMutableArray *)keysArr;
///传入keysArr和placeholdersArr 校验是否为空
-(BOOL)valEmptyWithKeysArr:(NSMutableArray *)keysArr placeholdersArr:(NSMutableArray *)placeholdersArr;
///传入keysArr和placeholdersArr 根据规则自动合法性校验
-(BOOL)valAutoRuleWithKeysArr:(NSMutableArray *)keysArr placeholdersArr:(NSMutableArray *)placeholdersArr;
///传入keysArr和placeholdersArr 同时包含了空校验与自动合法性校验
-(BOOL)valWithKeysArr:(NSMutableArray *)keysArr placeholdersArr:(NSMutableArray *)placeholdersArr;
@end
