//
//  ZXDataAssignment.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/9.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "ZXDataAssignment.h"
@implementation ZXDataAssignment
+(NSObject *)dataAssignmentWithModel:(NSObject *)obj From:(NSUInteger)from Tfs:(NSMutableArray <UITextField *>*)tfs{
    u_int count;
    objc_property_t *properties  = class_copyPropertyList([obj class],&count);
    NSUInteger sum = MIN(tfs.count, count);
    NSUInteger j = 0;
    for(NSUInteger i = from;i < sum;i++){
        const char *propertyNameChar = property_getName(properties[i]);
        NSString *propertyNameStr = [NSString stringWithUTF8String: propertyNameChar];
        if(j < tfs.count){
            [obj setValue:((UITextField *)tfs[j]).text forKeyPath:propertyNameStr];
        }
        j++;
        
    }
    return obj;
}
+(NSObject *)dataReAssignmentWithModel:(NSObject *)obj From:(NSUInteger)from Tfs:(NSMutableArray <UITextField *>*)tfs{
    u_int count;
    objc_property_t *properties  = class_copyPropertyList([obj class],&count);
    NSUInteger sum = MIN(tfs.count, count);
    NSUInteger j = 0;
    for(NSUInteger i = from;i < sum;i++){
        const char *propertyNameChar = property_getName(properties[i]);
        NSString *propertyNameStr = [NSString stringWithUTF8String: propertyNameChar];
        if(j < tfs.count){
            ((UITextField *)tfs[j]).text = [obj valueForKeyPath:propertyNameStr];
        }
        j++;
        
    }
    return obj;
}
+(NSObject *)dataAssignmentWithModel:(NSObject *)obj Tfs:(NSMutableArray <UITextField *>*)tfs{
    return [self dataAssignmentWithModel:obj From:0 Tfs:tfs];
}
+(NSObject *)dataReAssignmentWithModel:(NSObject *)obj Tfs:(NSMutableArray <UITextField *>*)tfs{
    return [self dataReAssignmentWithModel:obj From:0 Tfs:tfs];
}

+(NSObject *)dataAssignmentWithModel:(NSObject *)obj InView:(UIView *)view{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    NSMutableArray *tfs = [uiget getUIInView:view type:UITypeTextField recursive:YES];
    return [self dataAssignmentWithModel:obj Tfs:tfs];
}

+(NSObject *)dataReAssignmentWithModel:(NSObject *)obj InView:(UIView *)view{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    NSMutableArray *tfs = [uiget getUIInView:view type:UITypeTextField recursive:YES];
    return [self dataReAssignmentWithModel:obj Tfs:tfs];
}

+(NSObject *)dataAssignmentWithModel:(NSObject *)obj From:(NSUInteger)from InView:(UIView *)view{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    NSMutableArray *tfs = [uiget getUIInView:view type:UITypeTextField recursive:YES];
    return [self dataAssignmentWithModel:obj From:from Tfs:tfs];
}
+(NSObject *)dataReAssignmentWithModel:(NSObject *)obj From:(NSUInteger)from InView:(UIView *)view{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    NSMutableArray *tfs = [uiget getUIInView:view type:UITypeTextField recursive:YES];
    return [self dataReAssignmentWithModel:obj From:from Tfs:tfs];
}
@end
