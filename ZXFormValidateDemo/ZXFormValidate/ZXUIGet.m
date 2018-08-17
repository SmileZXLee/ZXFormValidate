//
//  ZXUIGet.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/9.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "ZXUIGet.h"
@interface ZXUIGet()
@property(nonatomic,strong)NSMutableArray *resultUIArr;
@property(nonatomic,strong)NSArray *uiClassArr;
@end
@implementation ZXUIGet
+ (id)sharedInstance {
    static ZXUIGet *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!sharedInstance) {
            sharedInstance = [[self alloc] init];
        }
    });
    sharedInstance.resultUIArr = [NSMutableArray array];
    sharedInstance.uiClassArr = @[[UIView class],[UITextField class],[UILabel class],[UIButton class],[UIImageView class]];
    return sharedInstance;
}
-(NSMutableArray *)getUIInView:(UIView *)view type:(UIType)type recursive:(BOOL)recursive{
    for (UIView *subView in view.subviews) {
        if([subView isKindOfClass:(Class)_uiClassArr[type]]){
            [_resultUIArr addObject:subView];
        }
        if(recursive){
            //递归查找
            if(subView.subviews.count){
                [self getUIInView:subView type:type recursive:recursive];
            }
        }
    }
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:_resultUIArr];
    NSMutableArray *resultArr = [set.array mutableCopy];
    return resultArr;
}

-(UITextField *)getTfInView:(UIView *)view placeHolder:(NSString *)placeHolder{
    UITextField *resultTf;
    NSArray *resultTfArr = [self getUIInView:view type:UITypeTextField recursive:YES];
    for (UITextField *tf in resultTfArr) {
        if([tf.placeholder isEqualToString:placeHolder]){
            resultTf = tf;
        }
    }
    
    return resultTf;
}

-(NSMutableArray *)getUIInView:(UIView *)view color:(UIColor *)color type:(UIType)type{
    NSMutableArray *uiArr = [self getUIInView:view type:type recursive:YES];
    NSMutableArray *matchArr = [NSMutableArray array];
    for (UIView *subView in uiArr) {
        if((CGColorEqualToColor(subView.backgroundColor.CGColor, color.CGColor))){
            [matchArr addObject:subView];
        }
    }
    return matchArr;
}

-(NSMutableArray *)getUIInView:(UIView *)view frame:(CGRect)frame type:(UIType)type{
    NSMutableArray *uiArr = [self getUIInView:view type:type recursive:YES];
    NSMutableArray *matchArr = [NSMutableArray array];
    for (UIView *subView in uiArr) {
        if(CGRectEqualToRect(subView.frame,frame)){
            [matchArr addObject:subView];
        }
    }
    return matchArr;
}
-(NSMutableArray *)getUIInView:(UIView *)view height:(CGFloat)height type:(UIType)type{
    NSMutableArray *uiArr = [self getUIInView:view type:type recursive:YES];
    NSMutableArray *matchArr = [NSMutableArray array];
    for (UIView *subView in uiArr) {
        if(ABS(subView.frame.size.height - height) < 1){
            [matchArr addObject:subView];
        }
    }
    return matchArr;
}
@end
