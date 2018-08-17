//
//  UIViewController+GETUI.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "UIViewController+GETUI.h"

@implementation UIViewController (GETUI)
-(NSMutableArray *)getUIWithType:(UIType)type{
    return [self.view getUIWithType:type];
}
-(UITextField *)getTfWithPlaceHolder:(NSString *)placeHolder{
    return [self.view getTfWithPlaceHolder:placeHolder];
}
-(NSMutableArray *)getTfs{
    return [self.view getTfs];
}
-(NSMutableArray *)getUIWithColor:(UIColor *)color type:(UIType)type{
    return [self.view getUIWithColor:color type:type];
}
-(NSMutableArray *)getUIWithHeight:(CGFloat)height type:(UIType)type{
    return [self.view getUIWithHeight:height type:type];
}
-(NSMutableArray *)getUIWithFrame:(CGRect)frame type:(UIType)type{
    return [self.view getUIWithFrame:frame type:type];
}
@end
