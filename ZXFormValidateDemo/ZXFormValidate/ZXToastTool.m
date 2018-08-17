//
//  ZXToastTool.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "ZXToastTool.h"

@implementation ZXToastTool

#warning 在这里统一修改弹窗样式
+(void)showToast:(NSString *)str{
    if(!str || ![str isEmpty]){
        [[UIApplication sharedApplication].keyWindow makeToast:str duration:1.5 position:CSToastPositionCenter];
    }
}
@end
