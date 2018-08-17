//
//  NSObject+DataAssignment.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DataAssignment)
///获取模型的所有属性名
-(NSMutableArray *)getAllPropertyNames;
///获取模型的所有属性值
-(NSMutableArray *)getAllValues;
///根据UITextField数组进行数据填充 注意赋值顺序 从模型的form处开始 模型赋值
-(NSObject *)dataAssWithTfs:(NSMutableArray <UITextField *>*)tfs From:(NSUInteger)from;
///根据UITextField数组进行数据填充 注意赋值顺序 模型赋值
-(NSObject *)dataAssWithTfs:(NSMutableArray <UITextField *>*)tfs;
///根据UITextField父类View进行数据填充 注意赋值顺序 模型赋值
-(NSObject *)dataAssInView:(UIView *)view;
///根据UITextField父类View进行数据填充 注意赋值顺序 从模型的from处开始 模型赋值
-(NSObject *)dataAssInView:(UIView *)view From:(NSUInteger)from;
///模型转字典
-(NSMutableDictionary *)toDic;
///字典转模型
+(instancetype)toModelWithDic:(NSMutableDictionary *)dic;
@end
