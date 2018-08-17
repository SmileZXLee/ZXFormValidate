//
//  ZXUIGet.h
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/9.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_OPTIONS(NSUInteger, UIType) {
    UITypeView = 0,
    UITypeTextField,
    UITypeLabel,
    UITypeButton,
    UITypeImageView
};

@interface ZXUIGet : NSObject
+ (id)sharedInstance;
///获取父控件对应类型UI recursive：是否递归
-(NSMutableArray *)getUIInView:(UIView *)view type:(UIType)type recursive:(BOOL)recursive;
///根据placeHolder从父控件中获取UITextField
-(UITextField *)getTfInView:(UIView *)view placeHolder:(NSString *)placeHolder;
///根据颜色获取控件
-(NSMutableArray *)getUIInView:(UIView *)view color:(UIColor *)color type:(UIType)type;
///根据frame获取控件
-(NSMutableArray *)getUIInView:(UIView *)view frame:(CGRect)frame type:(UIType)type;
///根据高度获取控件
-(NSMutableArray *)getUIInView:(UIView *)view height:(CGFloat)height type:(UIType)type;
@end
