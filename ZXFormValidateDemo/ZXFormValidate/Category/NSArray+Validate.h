//
//  NSArray+Validate.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Validate)
///校验UITextField数组是否为空
- (BOOL)valTfsEmpty;
///根据规则校验UITextField数组 按照传入的提示字符串显示提示
- (BOOL)valTfsRule:(NSMutableArray*)rules alertStrs:(NSMutableArray <NSString *>*)alertStrs;
///根据规则校验UITextField数组 显示提示内容默认
- (BOOL)valTfsRule:(NSMutableArray*)rules;
///校验数组是否为空 按照传入的提示字符串显示提示
- (BOOL)valEmptyAlertStr:(NSString *)alertStr;
///根据规则校验UITextField数组 显示提示内容默认 规则根据占位符自动识别
- (BOOL)valTfsAutoRule;
///同时包含了UITextField空校验和自动规则校验
-(BOOL)valTfs;
@end
