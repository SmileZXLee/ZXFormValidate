//
//  UIViewController+Validate.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "UIViewController+Validate.h"

@implementation UIViewController (Validate)
///校验控制器中TF是否为空
-(BOOL)valTfsEmpty{
    return [self.view valTfsEmpty];
}
///校验控制器中TF是否为空 并排除一些TF
-(BOOL)valTfsEmptyEscapeTfs:(NSMutableArray <UITextField *>*)escapeTfs{
    return [self.view valTfsEmptyEscapeTfs:escapeTfs];
}
-(BOOL)valTfsAutoRule{
    return [self.view valTfsAutoRule];
}
///校验TF数组 包含空判定与自动正则判定
-(BOOL)valTfs{
    return [self valTfsEmpty] && [self valTfsAutoRule];
}
@end
