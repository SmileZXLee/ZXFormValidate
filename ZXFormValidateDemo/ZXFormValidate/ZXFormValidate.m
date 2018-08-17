//
//  ZXFormValidate.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/8.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "ZXFormValidate.h"
static NSString *staticValue;
@implementation ZXFormValidate

+(BOOL)validateTfEmpty:(UITextField *)tf{
    if(tf.frame.size.height > 0 && !tf.hidden && (!tf.text || [tf.text isEmpty])){
        [self showUIToast:tf.placeholder];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [tf becomeFirstResponder];
        });
        return NO;
    }
    return YES;
}

+(BOOL)validateTfsEmpty:(NSMutableArray *)tfs{
    for (UITextField *tf in tfs) {
        if(![self validateTfEmpty:tf]){
            return NO;
        }
    }
    return YES;
}

+(BOOL)validateTfsEmptyWithSuperView:(UIView *)superView{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    NSArray * tfsArr = [uiget getUIInView:superView type:UITypeTextField recursive:YES];
    if(!tfsArr.count){
        return YES;
    }
    return [self validateTfsEmpty:[tfsArr mutableCopy]];
}

+(BOOL)validateTfsEmptyWithSuperView:(UIView *)superView escapeTfs:(NSMutableArray <UITextField *>*)escapeTfs{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    NSArray * tfsArr = [uiget getUIInView:superView type:UITypeTextField recursive:YES];
    if(!tfsArr.count){
        return YES;
    }
    NSMutableArray *escapedTfs = [NSMutableArray array];
    for (UITextField *tf in tfsArr) {
        if(![escapeTfs containsObject:tf]){
            [escapedTfs addObject:tf];
        }
    }
    return [self validateTfsEmpty:[escapedTfs mutableCopy]];
}

+(BOOL)validateTfsEmptyWithSuperView:(UIView *)superView escapeTfPlaceHolders:(NSMutableArray <NSString *>*)escapeTfPlaceHolders{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    NSArray * tfsArr = [uiget getUIInView:superView type:UITypeTextField recursive:YES];
    if(!tfsArr.count){
        return YES;
    }
    NSMutableArray *escapedTfs = [NSMutableArray array];
    for (UITextField *tf in tfsArr) {
        if(![escapeTfPlaceHolders containsObject:tf.placeholder]){
            [escapedTfs addObject:tf];
        }
    }
    return [self validateTfsEmpty:[escapedTfs mutableCopy]];
}

+(BOOL)validateTfRule:(UITextField *)tf rule:(ValidateRule)rule alertStr:(NSString *)alertStr{
    if(tf.frame.size.height == 0 || tf.hidden)return YES;
    if(!tf.text ||[tf.text isEmpty]){
        [self showUIToast:tf.placeholder];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [tf becomeFirstResponder];
        });
        return NO;
    }else{
        staticValue = tf.text;
        NSArray *selArr = @[@"isPhoneNumber",@"isIdCard",@"isUrl",@"isAmount",@"isBankNumber",@"isEmail"];
        NSArray *errNoticeArr = @[@"手机号码不合法",@"身份证号码不合法",@"URL不合法",@"金额不合法",@"银行卡号不合法",@"邮箱号不合法"];
        SEL sel = NSSelectorFromString(selArr[rule]);
        BOOL resultBOOL = [self performSelector:sel withObject:nil];
        if(!resultBOOL){
            if(!alertStr || [alertStr isEmpty]){
                [self showUIToast:errNoticeArr[rule]];
            }else{
                [self showUIToast:alertStr];
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [tf becomeFirstResponder];
            });
        }
        return resultBOOL;
        
    }
}

+(BOOL)validateTfRule:(UITextField *)tf rule:(ValidateRule)rule{
    return [self validateTfRule:tf rule:rule alertStr:nil];
}
+(BOOL)validateTfsRule:(NSMutableArray <UITextField *>*)tfs rules:(NSMutableArray*)rules alertStrs:(NSMutableArray <NSString *>*)alertStrs{
    BOOL result = YES;
    if(alertStrs.count && (!alertStrs.count && tfs.count != rules.count && rules.count!= alertStrs.count))return NO;
    if(!alertStrs.count && (!alertStrs.count && tfs.count != rules.count))return NO;
    NSUInteger i = 0;
    for (UITextField *tf in tfs) {
        if(![self validateTfRule:tf rule:[rules[i] integerValue] alertStr:alertStrs[i]]){
            result = NO;
            break;
        }
        i++;
    }
    return result;
}

+(BOOL)validateTfsRule:(NSMutableArray <UITextField *>*)tfs rules:(NSMutableArray*)rules{
    return [self validateTfsRule:tfs rules:rules alertStrs:nil];
}

+(BOOL)validateStrEmpty:(NSString *)str alertStr:(NSString *)alertStr{
    if(!str || [str isEmpty]){
        [self showUIToast:alertStr];
        return NO;
    }
    return YES;
}

+(BOOL)validateArrEmpty:(NSMutableArray *)arr alertStr:(NSString *)alertStr{
    if(!arr.count){
        [self showUIToast:alertStr];
        return NO;
    }
    return YES;
}

+(BOOL)validateObjEmpty:(NSObject *)obj alertStr:(NSString *)alertStr{
    if(!obj){
        [self showUIToast:alertStr];
        return NO;
    }
    return YES;
}

+(BOOL)isPhoneNumber{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^(13|14|15|17|18|19)\\d{9}$"] evaluateWithObject:staticValue];
}
+(BOOL)isUrl{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"((http|ftp|https)://)(([a-zA-Z0-9\\._-]+\\.[a-zA-Z]{2,6})|([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\\&%_\\./-~-]*)?"] evaluateWithObject:staticValue];
    
}

+ (BOOL)isAmount{
    NSString *stringRegex = @"(\\+)?(([0]|(0[.]\\d{0,2}))|([1-9]\\d{0,5}(([.]\\d{0,2})?)))?";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    BOOL flag = [phoneTest evaluateWithObject:staticValue];
    return flag;
}
+ (BOOL)isIdCard{
    if (staticValue.length == 15) {
        //|  地址  |   年    |   月    |   日    |
        NSString *regex = @"^(\\d{6})([3-9][0-9][01][0-9][0-3])(\\d{4})$";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [identityCardPredicate evaluateWithObject:staticValue];
    } else if (staticValue.length == 18) {
        // 正则表达式判断基本 身份证号是否满足格式
        NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
        NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
        //如果通过该验证，说明身份证格式正确，但准确性还需计算
        if(![identityStringPredicate evaluateWithObject:staticValue]) return NO;
        
        //** 开始进行校验 *//
        //将前17位加权因子保存在数组里
        NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++) {
            NSInteger subStrIndex = [[staticValue substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            idCardWiSum+= subStrIndex * idCardWiIndex;
        }
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        //得到最后一位身份证号码
        NSString *idCardLast= [staticValue substringWithRange:NSMakeRange(17, 1)];
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2) {
            if(![idCardLast isEqualToString:@"X"]||![idCardLast isEqualToString:@"x"]) {
                return NO;
            }
        }
        else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if(![idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
                return NO;
            }
        }
        
    } else {
        return NO;
    }
    return YES;

}
+ (BOOL)isBankNumber{
    NSString *bankNum=@"^([0-9]{15}|[0-9]{16}|[0-9]{17}|[0-9]{18}|[0-9]{19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:staticValue];
    return isMatch;
}
+ (BOOL)isEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:staticValue];
}
+ (id)performSelector:(SEL)selector withObjects:(NSArray *)objects
{
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    if (signature == nil) {
        
    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    NSInteger paramsCount = signature.numberOfArguments - 2;
    paramsCount = MIN(paramsCount, objects.count);
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = objects[i];
        if ([object isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&object atIndex:i + 2];
    }
    [invocation invoke];
    id returnValue = nil;
    if (signature.methodReturnLength) {
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}


+(void)showUIToast:(NSString *)str{
    [ZXToastTool showToast:str];
}
@end
