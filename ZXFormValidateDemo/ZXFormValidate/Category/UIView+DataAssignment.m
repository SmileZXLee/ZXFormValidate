//
//  UIView+DataAssignment.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "UIView+DataAssignment.h"

@implementation UIView (DataAssignment)
-(NSObject *)dataAssWithModel:(NSObject *)obj From:(NSUInteger)from{
    return [[self getTfs] dataAssWithModel:obj From:from];
}
-(NSObject *)dataAssWithModel:(NSObject *)obj{
    return [[self getTfs] dataAssWithModel:obj From:0];
}
@end
