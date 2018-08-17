//
//  ZXDataAssignment.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/9.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXDataAssignment : NSObject
///传入模型和UITextField数组进行数据填充 注意赋值顺序 模型赋值
+(NSObject *)dataAssignmentWithModel:(NSObject *)obj Tfs:(NSMutableArray <UITextField *>*)tfs;
///传入模型和UITextField数组进行数据填充 注意赋值顺序 从模型的from处开始 模型赋值
+(NSObject *)dataAssignmentWithModel:(NSObject *)obj From:(NSUInteger)from Tfs:(NSMutableArray <UITextField *>*)tfs;

///传入模型和UITextField父类View进行数据填充 注意赋值顺序 模型赋值
+(NSObject *)dataAssignmentWithModel:(NSObject *)obj InView:(UIView *)view;
///传入模型和UITextField父类View进行数据填充 注意赋值顺序 从模型的from处开始 模型赋值
+(NSObject *)dataAssignmentWithModel:(NSObject *)obj From:(NSUInteger)from InView:(UIView *)viewl;



///传入模型和UITextField数组进行数据填充 注意赋值顺序 TF赋值
+(NSObject *)dataReAssignmentWithModel:(NSObject *)obj Tfs:(NSMutableArray <UITextField *>*)tfs;
///传入模型和UITextField数组进行数据填充 注意赋值顺序 从模型的from处开始 TF赋值
+(NSObject *)dataReAssignmentWithModel:(NSObject *)obj From:(NSUInteger)from Tfs:(NSMutableArray <UITextField *>*)tfs;

///传入模型和UITextField父类View进行数据填充 注意赋值顺序 TF赋值
+(NSObject *)dataReAssignmentWithModel:(NSObject *)obj InView:(UIView *)view;
///传入模型和UITextField父类View进行数据填充 注意赋值顺序 从模型的from处开始 TF赋值
+(NSObject *)dataReAssignmentWithModel:(NSObject *)obj From:(NSUInteger)from InView:(UIView *)viewl;
@end
