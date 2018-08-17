//
//  ZXFormValidate.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/8.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSUInteger, ValidateRule) {
    ValidateRulePhoneNumber = 0,
    ValidateRuleIDCrad,
    ValidateRuleUrl,
    ValidateRuleAmount,
    ValidateRuleBankNum,
    ValidateRuleEmail,
};
@interface ZXFormValidate : NSObject
///校验UITextField是否为空
+(BOOL)validateTfEmpty:(UITextField *)tf;
///校验UITextField数组中TF是否为空
+(BOOL)validateTfsEmpty:(NSMutableArray *)tfs;
///根据父类View校验UITextField数组中TF是否为空
+(BOOL)validateTfsEmptyWithSuperView:(UIView *)superView;
///根据父类View校验UITextField数组中TF是否为空并根据UITextField对象排除
+(BOOL)validateTfsEmptyWithSuperView:(UIView *)superView escapeTfs:(NSMutableArray <UITextField *>*)escapeTfs;
///根据父类View校验UITextField数组中TF是否为空并根据UITextField占位符排除
+(BOOL)validateTfsEmptyWithSuperView:(UIView *)superView escapeTfPlaceHolders:(NSMutableArray <NSString *>*)escapeTfPlaceHolders;
///根据规则校验UITextField 显示提示内容默认
+(BOOL)validateTfRule:(UITextField *)tf rule:(ValidateRule)rule;
///根据规则校验UITextField 按照传入的提示字符串显示提示
+(BOOL)validateTfRule:(UITextField *)tf rule:(ValidateRule)rule alertStr:(NSString *)alertStr;
///根据规则校验UITextField数组 显示提示内容默认
+(BOOL)validateTfsRule:(NSMutableArray <UITextField *>*)tfs rules:(NSMutableArray*)rules;
///根据规则校验UITextField数组 按照传入的提示字符串显示提示
+(BOOL)validateTfsRule:(NSMutableArray <UITextField *>*)tfs rules:(NSMutableArray*)rules alertStrs:(NSMutableArray <NSString *>*)alertStrs;
///校验字符串是否为空
+(BOOL)validateStrEmpty:(NSString *)str alertStr:(NSString *)alertStr;
///校验数组是否为空
+(BOOL)validateArrEmpty:(NSMutableArray *)arr alertStr:(NSString *)alertStr;
///校验对象是否为空
+(BOOL)validateObjEmpty:(NSObject *)obj alertStr:(NSString *)alertStr;
@end
