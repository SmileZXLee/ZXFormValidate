//
//  UITextField+Validate.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Validate)
///校验是否为空
-(BOOL)valEmpty;
///根据规则校验 显示提示内容
-(BOOL)valRule:(ValidateRule)rule alertStr:(NSString *)alertStr;
///根据规则校验 显示提示内容默认
-(BOOL)valRule:(ValidateRule)rule;
///根据自定义规则校验 显示提示内容
-(BOOL)valBool:(BOOL)valid alertStr:(NSString *)alertStr;
///根据规则校验 显示提示内容 规则根据占位符识别
-(BOOL)valAutoRuleAlertStr:(NSString *)alertStr;
///根据规则校验 显示提示内容默认 规则根据占位符自动识别
-(BOOL)valAutoRule;
@end
