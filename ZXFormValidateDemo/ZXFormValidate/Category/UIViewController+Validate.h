//
//  UIViewController+Validate.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Validate)
///根据父类View校验UITextField数组中TF是否为空
-(BOOL)valTfsEmpty;
///根据父类View校验UITextField数组中TF是否为空并根据UITextField对象排除
-(BOOL)valTfsEmptyEscapeTfs:(NSMutableArray <UITextField *>*)escapeTfs;
///根据父类View校验UITextField数组 显示提示内容默认 规则根据占位符自动识别
- (BOOL)valTfsAutoRule;
///根据父类View校验UITextField数组 包含空判定与自动正则判定
-(BOOL)valTfs;
@end
