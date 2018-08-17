//
//  NSDictionary+Validate.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/16.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "NSDictionary+Validate.h"

@implementation NSDictionary (Validate)
-(int)getNullIndexWithKeysArr:(NSMutableArray *)keysArr{
    int index = -1;
    //因为字典是无序的 因此需要有序的keys数组
    int i = 0;
    for (NSString *key in keysArr) {
        if([NSString isEmptyWithStr:[self valueForKeyPath:key]]){
            index = i;
            break;
        }
        i++;
    }
    return index;
}
-(BOOL)valEmptyWithKeysArr:(NSMutableArray *)keysArr placeholdersArr:(NSMutableArray *)placeholdersArr{
    int index = [self getNullIndexWithKeysArr:keysArr];
    if(index == -1){
        return YES;
    }else{
        if(index < placeholdersArr.count){
            NSString *alertStr = placeholdersArr[index];
            [self showUIToast:alertStr];
            return NO;
        }else{
            return YES;
        }
        
    }
}

-(BOOL)valAutoRuleWithKeysArr:(NSMutableArray *)keysArr placeholdersArr:(NSMutableArray *)placeholdersArr{
    NSArray *ruleArr = [ZXFormValidateConst getRuleArr];
    BOOL val = YES;
    for (int i = 0;i < ruleArr.count;i++) {
        NSArray *perRuleArr = ruleArr[i];
        for (NSString *ruleStr in perRuleArr) {
            NSString *contentStr;
            int ruleIndex = -1;
            int plIndex = -1;
            for(int j = 0; j < placeholdersArr.count;j++){
                if([placeholdersArr[j] containsString:ruleStr]){
                    ruleIndex = i;
                    plIndex = j;
                    contentStr = [self valueForKeyPath:keysArr[j]];
                    break;
                }
            }
            if(ruleIndex >= 0){
                NSString *placeholderStr = plIndex >= 0 ? placeholdersArr[plIndex] : nil;
                if(![contentStr valRule:ruleIndex alertStr:[placeholderStr getAlertStr]]){
                    return NO;
                }
                
            }
        }
        
    }
    
    return val;
}
-(BOOL)valWithKeysArr:(NSMutableArray *)keysArr placeholdersArr:(NSMutableArray *)placeholdersArr{
    return [self valEmptyWithKeysArr:keysArr placeholdersArr:placeholdersArr] && [self valAutoRuleWithKeysArr:keysArr placeholdersArr:placeholdersArr];
}

-(void)showUIToast:(NSString *)str{
    [ZXToastTool showToast:str];
}
@end
