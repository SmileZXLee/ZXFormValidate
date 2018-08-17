//
//  NSString+Validate.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)
#warning 字符串为nil 则不会验证
///字符串是否为空
-(BOOL)isEmpty;
///校验字符串是否为空 按照传入的提示字符串显示提示
-(BOOL)valEmptyAlertStr:(NSString *)alertStr;
///根据规则校验字符串 按照传入的提示字符串显示提示
-(BOOL)valRule:(ValidateRule)rule alertStr:(NSString *)alertStr;
///根据自定义规则校验字符串 按照传入的提示字符串显示提示
-(BOOL)valBool:(BOOL)valid alertStr:(NSString *)alertStr;
///字符串是否为空 类方法
+(BOOL)isEmptyWithStr:(NSString *)str;
///根据占位符获取提示字符串
-(NSString *)getAlertStr;
@end
