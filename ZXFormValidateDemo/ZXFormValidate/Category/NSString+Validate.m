//
//  NSString+Validate.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)
-(BOOL)valEmptyAlertStr:(NSString *)alertStr{
    if([self isEmpty]){
        [self showUIToast:alertStr];
        return NO;
    }
    return YES;
}

-(BOOL)isEmpty{
    return ![self stringByReplacingOccurrencesOfString:@" " withString:@""].length;
}
+(BOOL)isEmptyWithStr:(NSString *)str{
    if(!str)return YES;
    if(![str isKindOfClass:[NSString class]]){
        return NO;
    }
    return ![str stringByReplacingOccurrencesOfString:@" " withString:@""].length;
}
-(void)showUIToast:(NSString *)str{
    [ZXToastTool showToast:str];
}
-(BOOL)valRule:(ValidateRule)rule alertStr:(NSString *)alertStr{
    UITextField *tf = [[UITextField alloc]init];
    tf.text = self;
    tf.frame = CGRectMake(0, 0, 0, 1);
    return [tf valRule:rule alertStr:alertStr];
}
-(BOOL)valBool:(BOOL)valid alertStr:(NSString *)alertStr{
    if(!valid){
        [self showUIToast:alertStr];
    }
    return valid;
}
-(NSString *)getAlertStr{
    return [[self stringByReplacingOccurrencesOfString:@"请输入" withString:@""] stringByAppendingString:@"不合法"];
}
@end
