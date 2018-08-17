//
//  NSArray+Validate.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "NSArray+Validate.h"

@implementation NSArray (Validate)
- (BOOL)valTfsEmpty{
    for (UITextField *tf in self) {
        if(![tf valEmpty]){
            return NO;
        }
    }
    return YES;
}
- (BOOL)valTfsRule:(NSMutableArray*)rules alertStrs:(NSMutableArray <NSString *>*)alertStrs{
    BOOL result = YES;
    
    if(alertStrs.count && (!alertStrs.count && self.count != rules.count && rules.count!= alertStrs.count))return NO;
    if(!alertStrs.count && (!alertStrs.count && self.count != rules.count))return NO;
    NSUInteger i = 0;
    for (UITextField *tf in self) {
        if(![tf valRule:[rules[i] integerValue] alertStr:alertStrs[i]]){
            result = NO;
            break;
        }
        i++;
    }
    return result;
}
- (BOOL)valTfsRule:(NSMutableArray*)rules{
    return [self valTfsRule:rules alertStrs:nil];
}

- (BOOL)valEmptyAlertStr:(NSString *)alertStr{
    if(!self.count){
        [self showUIToast:alertStr];
        return NO;
    }
    return YES;
}
- (BOOL)valTfsAutoRule{
    for (UITextField *tf in self) {
        if(![tf valAutoRule]){
            return NO;
        }
    }
    return YES;
}
-(BOOL)valTfs{
    return [self valTfsEmpty] && [self valTfsAutoRule];
}
-(void)showUIToast:(NSString *)str{
    [ZXToastTool showToast:str];
}
@end
