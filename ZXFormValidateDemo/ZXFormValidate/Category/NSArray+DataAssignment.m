//
//  NSArray+DataAssignment.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "NSArray+DataAssignment.h"
@implementation NSArray (DataAssignment)
-(NSObject *)dataAssWithModel:(NSObject *)obj From:(NSUInteger)from{
    u_int count;
    objc_property_t *properties  = class_copyPropertyList([obj class],&count);
    NSUInteger sum = MIN(self.count, count);
    NSUInteger j = 0;
    for(NSUInteger i = from;i < sum;i++){
        const char *propertyNameChar = property_getName(properties[i]);
        NSString *propertyNameStr = [NSString stringWithUTF8String: propertyNameChar];
        if(j < self.count){
            ((UITextField *)self[j]).text = [obj valueForKeyPath:propertyNameStr];
        }
        j++;
        
    }
    return self;
}
-(NSObject *)dataAssWithModel:(NSObject *)obj{
    return [self dataAssWithModel:obj From:0];
}
@end
