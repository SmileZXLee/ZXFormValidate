//
//  NSObject+Validate.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Validate)
///校验对象是否为空 并显示对应提示信息 对象为nil 或者对象中的属性都为nil即为空
-(BOOL)valEmptyAlertStr:(NSString *)alertStr;
///对象中的每个属性是否都有值
-(BOOL)isAll;
///对象是否为空 对象为nil 或者对象中的属性都为nil即为空
-(BOOL)isNull;
@end
