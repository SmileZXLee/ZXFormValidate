//
//  UIView+Validate.m
//  ZXFormValidate
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "UIView+Validate.h"
@implementation UIView (Validate)
-(BOOL)valTfsEmpty{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    NSMutableArray *tfsArr = [uiget getUIInView:self type:UITypeTextField recursive:YES];
    if(!tfsArr.count){
        return YES;
    }
    if([self isKindOfClass:[UITableView class]]){
        tfsArr = (NSMutableArray *)[[tfsArr reverseObjectEnumerator] allObjects];
    }
    return [tfsArr valTfsEmpty];
}
-(BOOL)valTfsEmptyEscapeTfs:(NSMutableArray <UITextField *>*)escapeTfs{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    NSArray * tfsArr = [uiget getUIInView:self type:UITypeTextField recursive:YES];
    if(!tfsArr.count){
        return YES;
    }
    NSMutableArray *escapedTfs = [NSMutableArray array];
    for (UITextField *tf in tfsArr) {
        if(![escapeTfs containsObject:tf]){
            [escapedTfs addObject:tf];
        }
    }
    if([self isKindOfClass:[UITableView class]]){
        escapedTfs = (NSMutableArray *)[[escapedTfs reverseObjectEnumerator] allObjects];
    }
    return [escapedTfs valTfsEmpty];
}
-(BOOL)valTfsAutoRule{
    ZXUIGet *uiget = [ZXUIGet sharedInstance];
    NSMutableArray * tfsArr = [uiget getUIInView:self type:UITypeTextField recursive:YES];
    if(!tfsArr.count){
        return YES;
    }
    if([self isKindOfClass:[UITableView class]]){
        tfsArr = (NSMutableArray *)[[tfsArr reverseObjectEnumerator] allObjects];
    }
    return [tfsArr valTfsAutoRule];
}
-(BOOL)valTfs{
    return [self valTfsEmpty] && [self valTfsAutoRule];
}
@end
