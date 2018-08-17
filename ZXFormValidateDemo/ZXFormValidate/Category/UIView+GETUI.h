//
//  UIView+GETUI.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GETUI)
///获取Tfs
-(NSMutableArray *)getTfs;
///根据类型获取UI
-(NSMutableArray *)getUIWithType:(UIType)type;
///根据占位符获取Tf
-(UITextField *)getTfWithPlaceHolder:(NSString *)placeHolder;
///根据颜色和类型获取UI
-(NSMutableArray *)getUIWithColor:(UIColor *)color type:(UIType)type;
///根据高度和类型获取UI
-(NSMutableArray *)getUIWithHeight:(CGFloat)height type:(UIType)type;
///根据Frame和类型获取UI
-(NSMutableArray *)getUIWithFrame:(CGRect)frame type:(UIType)type;
@end
