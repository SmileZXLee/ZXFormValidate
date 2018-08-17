//
//  FixTfsVC.m
//  ZXFormValidateDemo
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//
#warning 固定的UITextf方案
#import "FixTfsVC.h"
#import "FixTfsModel.h"
@interface FixTfsVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *workTypeCellH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *positionCellH;

///Model
@property (nonatomic,strong) FixTfsModel *dataModel;
@end

@implementation FixTfsVC
//这边只介绍分类的使用方法 类方法调用不介绍了
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);
    //设置分隔线的颜色
    NSMutableArray *vs = [self getUIWithHeight:1 type:UITypeView];
    for (UIView *v in vs) {
        v.backgroundColor = [UIColor lightGrayColor];
        v.alpha = 0.3;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (IBAction)commitAction:(id)sender {
    //点击了提交
    
    if([self valOneStep]){
        //数据赋值
        [self.dataModel dataAssInView:self.view];
        NSMutableDictionary *dataDic = [self.dataModel toDic];
        NSLog(@"dataDic--%@",dataDic);
        [ZXToastTool showToast:@"一步验证通过"];
    }
    
    //多种形式校验
    //根据规则校验
    if([self valSomeEmpty] &&
       [self valSysRegular] && [self valCusRegular]){
        //数据赋值
        [self.dataModel dataAssInView:self.view];
        [ZXToastTool showToast:@"全部TF是否为空校验通过且正则校验通过"];
    }
    
}
#pragma mark 校验当前控制器的全部TF是否为空且自动根据TF占位符进行正则校验 一步到位
-(BOOL)valOneStep{
    return [self valTfs];
}
#pragma mark 校验当前控制器的全部TF是否为空
-(BOOL)valAllEmpty{
    return [self valTfsEmpty];
}
#pragma mark 校验当前控制器的TF是否为空 排除一些TF
-(BOOL)valSomeEmpty{
    NSArray *escapeTfs = @[[self getTfWithPlaceHolder:@"请输入曾用名(选填)"]];
    return [self valTfsEmptyEscapeTfs:[escapeTfs mutableCopy]];
}
#pragma mark 校验一些TF
-(BOOL)valTFsArrEmpty{
    NSMutableArray *tfsArr = [NSMutableArray array];
    NSMutableArray *allTfsArr = [self getTfs];
    for(NSUInteger i = 0; i < 3;i++){
        [tfsArr addObject:allTfsArr[i]];
    }
    [tfsArr addObject:[self getTfWithPlaceHolder:@"请输入性别"]];
    return [tfsArr valTfsEmpty];
}
#pragma mark 使用定义好的校验规则校验TF
-(BOOL)valSysRegular{
    //[self getTfWithPlaceHolder:@"请输入负责人电话"] 即为根据PlaceHolder为“请输入负责人电话”获取TF 若有多个返回最后一个 但是基本不会有多个PlaceHolder的情况 因此不返回数组
    return [[self getTfWithPlaceHolder:@"请输入负责人电话"]valRule:ValidateRulePhoneNumber] && [[self getTfWithPlaceHolder:@"请输入身份证号码"]valRule:ValidateRuleIDCrad] && [[self getTfWithPlaceHolder:@"请输入邮箱"]valRule:ValidateRuleEmail];
}
#pragma mark 自定义校验规则校验TF
-(BOOL)valCusRegular{
    //获取第一个TF（负责人姓名）
    UITextField *firstTf = [self getTfs][0];
    BOOL val = firstTf.text.length >= 2 && firstTf.text.length <= 4;
    return [firstTf valBool:val alertStr:@"姓名长度2-4之间"];
}

#pragma mark 校验字符串是否为空
-(BOOL)valStrEmpty{
    return [self.dataModel.otherStr valEmptyAlertStr:@"字符串为空"];
}

#pragma mark 校验对象为空
-(BOOL)valObjNull{
    //对象为nil或其所有属性值都为nil则判定为空
    return [self.dataModel valEmptyAlertStr:@"dataModel为空"];
}

#pragma mark 校验对象每个属性都已赋值
-(BOOL)valObjAll{
    //对象不为nil且其所有属性值都不为nil则判定为All
    return [self.dataModel isAll];
}
- (IBAction)didWorkAction:(id)sender {
    //切换是否工作
    
    //校验部分无需再次判定 若TF高度为0或为隐藏状态 则ZXFormValidate不会去校验
    UISwitch *workSwitch = (UISwitch *)sender;
    if(!workSwitch.isOn){
        //如果无工作
        self.workTypeCellH.constant = 0;
        self.positionCellH.constant = 0;
    }else{
        self.workTypeCellH.constant = 44;
        self.positionCellH.constant = 44;
    }
}
- (IBAction)infoBack:(id)sender{
    [self reqInfoBack];
}
-(void)reqInfoBack{
    //模拟数据回显
    
    //获得数据
    [self addData];
    //回显填充
    [self.view dataAssWithModel:self.dataModel];
}

-(FixTfsModel *)dataModel{
    if(!_dataModel){
        _dataModel = [[FixTfsModel alloc]init];
    }
    return _dataModel;
}

-(void)addData{
    //假数据。。
    self.dataModel.userName = @"张三";
    self.dataModel.userPhone = @"17720000000";
    self.dataModel.userIdCard = @"411300200001044989";
    self.dataModel.userAddress = @"福建省福州市";
    self.dataModel.userWorkType = @"程序员";
    self.dataModel.userGoodat = @"发呆";
    self.dataModel.userBankCardNum = @"6225365271562822";
    self.dataModel.userSex = @"男";
    self.dataModel.userFormerName = @"张四";
    self.dataModel.userPosition = @"软件开发";
    self.dataModel.userEmail = @"support@ifafu.cn";
}
@end
