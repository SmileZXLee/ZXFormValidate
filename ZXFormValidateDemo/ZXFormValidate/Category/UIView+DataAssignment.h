//
//  UIView+DataAssignment.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DataAssignment)
///传入模型进行数据填充 注意赋值顺序 获取当前view所有TF进行赋值 从from开始
-(NSObject *)dataAssWithModel:(NSObject *)obj From:(NSUInteger)from;
///传入模型进行数据填充 注意赋值顺序 获取当前view所有TF进行赋值
-(NSObject *)dataAssWithModel:(NSObject *)obj;
@end
