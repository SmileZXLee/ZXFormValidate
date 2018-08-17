//
//  ZXFormValidateConst.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/15.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "ZXFormValidateConst.h"

@implementation ZXFormValidateConst
+(NSArray *)getRuleArr{
    //根据PlaceHolder匹配对应的校验规则配置
    NSArray *rulePhoneNumberArr = @[@"手机",@"电话"];
    NSArray *ruleIDCradArr = @[@"身份证"];
    NSArray *ruleUrlArr = @[@"网址",@"网站"];
    NSArray *ruleAmountArr = @[@"金额"];
    NSArray *ruleBankNumArr = @[@"银行卡",@"卡号"];
    NSArray *ruleEmailArr = @[@"邮箱",@"邮件"];
    NSArray *ruleArr = @[rulePhoneNumberArr,ruleIDCradArr,ruleUrlArr,ruleAmountArr,ruleBankNumArr,ruleEmailArr];
    return ruleArr;
}
+(NSArray *)getSysSelArr{
    return @[@"isPhoneNumber",@"isIdCard",@"isUrl",@"isAmount",@"isBankNumber",@"isEmail"];
}
+(NSArray *)getSysErrNoticeArr{
    return @[@"手机号码不合法",@"身份证号码不合法",@"URL不合法",@"金额不合法",@"银行卡号不合法",@"邮箱号不合法"];
}

@end
