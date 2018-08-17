//
//  UIView+GETUI.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "UIView+GETUI.h"

@implementation UIView (GETUI)
-(NSMutableArray *)getUIWithType:(UIType)type{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    return [uiget getUIInView:self type:type recursive:YES];
}
-(UITextField *)getTfWithPlaceHolder:(NSString *)placeHolder{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    return [uiget getTfInView:self placeHolder:placeHolder];
}
-(NSMutableArray *)getTfs{
    return [self getUIWithType:UITypeTextField];
}
-(NSMutableArray *)getUIWithColor:(UIColor *)color type:(UIType)type{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    return [uiget getUIInView:self color:color type:type];
}
-(NSMutableArray *)getUIWithHeight:(CGFloat)height type:(UIType)type{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    return [uiget getUIInView:self height:height type:type];
}
-(NSMutableArray *)getUIWithFrame:(CGRect)frame type:(UIType)type{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    return [uiget getUIInView:self frame:frame type:type];
}
@end
