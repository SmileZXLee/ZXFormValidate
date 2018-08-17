//
//  UITextView+Validate.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/16.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "UITextView+Validate.h"

@implementation UITextView (Validate)
-(BOOL)valEmptyAlertStr:(NSString *)alertStr{
    if(self.frame.size.height > 0 && !self.hidden && (!self.text || [self.text isEmpty])){
        [self showUIToast:alertStr];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self becomeFirstResponder];
        });
        
        return NO;
    }
    return YES;
}

-(void)showUIToast:(NSString *)str{
    [ZXToastTool showToast:str];
}
@end
