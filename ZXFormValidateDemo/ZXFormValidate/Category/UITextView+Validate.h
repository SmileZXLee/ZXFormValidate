//
//  UITextView+Validate.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/16.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Validate)
///校验是否为空并显示提示内容
-(BOOL)valEmptyAlertStr:(NSString *)alertStr;
@end
