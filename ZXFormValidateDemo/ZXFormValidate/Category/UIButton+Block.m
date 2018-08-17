//
//  UIButton+Block.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "UIButton+Block.h"

@implementation UIButton (Block)
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    [super sendAction:action to:target forEvent:event];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

@end
