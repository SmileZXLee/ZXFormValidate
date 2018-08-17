//
//  FixTfsModel.h
//  ZXFormValidateDemo
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FixTfsModel : NSObject
///负责人姓名
@property (nonatomic, copy) NSString *userName;
///负责人电话
@property (nonatomic, copy) NSString *userPhone;
///身份证号码
@property (nonatomic, copy) NSString *userIdCard;
///家庭住址
@property (nonatomic, copy) NSString *userAddress;
///擅长方向
@property (nonatomic, copy) NSString *userGoodat;
///工作类型
@property (nonatomic, copy) NSString *userWorkType;
///银行卡号
@property (nonatomic, copy) NSString *userBankCardNum;
///性别
@property (nonatomic, copy) NSString *userSex;
///职位
@property (nonatomic, copy) NSString *userPosition;
///曾用名
@property (nonatomic, copy) NSString *userFormerName;
///邮箱
@property (nonatomic, copy) NSString *userEmail;

///字符串空测试
@property (nonatomic, copy) NSString *otherStr;
@end
