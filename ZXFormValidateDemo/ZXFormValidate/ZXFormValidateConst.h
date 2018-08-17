//
//  ZXFormValidateConst.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/15.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXFormValidateConst : NSObject
///获取自动规则校验数组
+(NSArray *)getRuleArr;
///获取系统规则校验方法数组
+(NSArray *)getSysSelArr;
///获取系统规则校验提示字符串数组
+(NSArray *)getSysErrNoticeArr;
@end
