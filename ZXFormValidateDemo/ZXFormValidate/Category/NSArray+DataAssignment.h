//
//  NSArray+DataAssignment.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DataAssignment)
///传入模型进行数据填充 注意赋值顺序 TF赋值
-(NSObject *)dataAssWithModel:(NSObject *)obj;
///传入模型进行数据填充 注意赋值顺序 从模型的from处开始 TF赋值
-(NSObject *)dataAssWithModel:(NSObject *)obj From:(NSUInteger)from;
@end
