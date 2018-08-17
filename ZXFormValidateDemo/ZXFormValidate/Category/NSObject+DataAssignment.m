//
//  NSObject+DataAssignment.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "NSObject+DataAssignment.h"
@implementation NSObject (DataAssignment)
-(NSMutableArray *)getAllPropertyNames{
    NSMutableArray *propertyNamesArr = [NSMutableArray array];
    u_int count;
    objc_property_t *properties  = class_copyPropertyList([self class],&count);
    for(NSUInteger i = 0;i < count;i++){
        const char *propertyNameChar = property_getName(properties[i]);
        NSString *propertyNameStr = [NSString stringWithUTF8String: propertyNameChar];
        [propertyNamesArr addObject:propertyNameStr];
        
    }
    return propertyNamesArr;
}
-(NSMutableArray *)getAllValues{
    NSMutableArray *valuesArr = [NSMutableArray array];
    u_int count;
    objc_property_t *properties  = class_copyPropertyList([self class],&count);
    for(NSUInteger i = 0;i < count;i++){
        const char *propertyNameChar = property_getName(properties[i]);
        NSString *propertyNameStr = [NSString stringWithUTF8String: propertyNameChar];
        id obj = [self valueForKeyPath:propertyNameStr];
        if(obj){
            [valuesArr addObject:obj];
        }else{
            [valuesArr addObject:@""];
        }
        
    }
    return valuesArr;
}
-(NSObject *)dataAssWithTfs:(NSMutableArray <UITextField *>*)tfs From:(NSUInteger)from{
    u_int count;
    objc_property_t *properties  = class_copyPropertyList([self class],&count);
    NSUInteger sum = MIN(tfs.count, count);
    NSUInteger j = 0;
    for(NSUInteger i = from;i < sum;i++){
        const char *propertyNameChar = property_getName(properties[i]);
        NSString *propertyNameStr = [NSString stringWithUTF8String: propertyNameChar];
        if(j < tfs.count){
            [self setValue:((UITextField *)tfs[j]).text forKeyPath:propertyNameStr];
        }
        j++;
        
    }
    return self;
}
-(NSObject *)dataAssWithTfs:(NSMutableArray <UITextField *>*)tfs{
    return [self dataAssWithTfs:tfs From:0];
}
-(NSObject *)dataAssInView:(UIView *)view{
    return [self dataAssWithTfs:[view getTfs]];
}
-(NSObject *)dataAssInView:(UIView *)view From:(NSUInteger)from{
    return [self dataAssWithTfs:[view getTfs] From:from];
}
//这边字典转模型和模型转字典都是一层的 只是为了方便测试 多级的可以用mjExtension或yymodel等，不想写了。
-(NSMutableDictionary *)toDic{
    if(!self)return nil;
    return [NSMutableDictionary dictionaryWithObjects:[self getAllValues] forKeys:[self getAllPropertyNames]];
}
+(instancetype)toModelWithDic:(NSMutableDictionary *)dic{
    Class selfCalss = [self class];
    id obj = [[selfCalss alloc]init];
    NSMutableArray *prosArr = [obj getAllPropertyNames];
    for (NSString *pro in prosArr) {
        if([dic.allKeys containsObject:pro]){
            [obj setValue:[dic objectForKey:pro] forKeyPath:pro];
        }
    }
    return obj;
}
@end
