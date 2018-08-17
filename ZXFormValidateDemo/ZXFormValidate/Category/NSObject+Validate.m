//
//  NSObject+Validate.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "NSObject+Validate.h"

@implementation NSObject (Validate)
-(BOOL)valEmptyAlertStr:(NSString *)alertStr{
    if([self isNull]){
        [self showUIToast:alertStr];
        return NO;
    }
    return YES;
}

-(BOOL)isAll{
    BOOL isAll = YES;
    u_int count;
    objc_property_t *properties  = class_copyPropertyList([self class],&count);
    for(NSUInteger i = 0;i < count;i++){
        const char *propertyNameChar = property_getName(properties[i]);
        NSString *propertyNameStr = [NSString stringWithUTF8String: propertyNameChar];
        if(![self valueForKeyPath:propertyNameStr]){
            isAll = NO;
        }
        
    }
    return isAll;
}
-(BOOL)isNull{
    if(!self)return YES;
    BOOL isNull = YES;
    u_int count;
    objc_property_t *properties  = class_copyPropertyList([self class],&count);
    for(NSUInteger i = 0;i < count;i++){
        const char *propertyNameChar = property_getName(properties[i]);
        NSString *propertyNameStr = [NSString stringWithUTF8String: propertyNameChar];
        if([self valueForKeyPath:propertyNameStr]){
            isNull = NO;
        }
    }
    return isNull;
}

-(void)showUIToast:(NSString *)str{
    [ZXToastTool showToast:str];
}
@end
