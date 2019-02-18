# ZXFormValidate
## ZXFormValidate用于快捷地进行表单校验，数据填充以及数据回显。
当您的表单来源于Xib时，您无需拖线定义任何一个UITextField
### 数据校验
***
* 校验当前控制器的全部UITextField是否为空，若有为空项，返回NO：
```
BOOL result = [self valTfsEmpty];
```
 * 校验当前控制器的全部TF是否为空且自动根据TF占位符进行正则校验，若有为空项，返回NO：
```
BOOL result = [self valTfs];
```
* 根据占位符名字获取UITextField：
```
BOOL result = [self getTfWithPlaceHolder:@"请输入曾用名(选填)"];
```
* 校验当前控制器的UITextField是否为空，并排除一些UITextField不校验，若有为空项，返回NO：
```
NSArray *escapeTfs = @[[self getTfWithPlaceHolder:@"请输入曾用名(选填)"]];
BOOL result = [self valTfsEmptyEscapeTfs:[escapeTfs mutableCopy]];
```
* 获取当前控制器所有UITextField对象：
```
NSMutableArray *allTfsArr = [self getTfs];
```
* 校验指定的UITextField，若有为空项，返回NO：
```
//tfsArr中存放着需要校验的UITextField
BOOL result = [tfsArr valTfsEmpty];
```
* 使用ZXFormValidate定义好的正则校验规则校验UITextField，若校验不通过，返回NO：
```
UITextField *phoneTf = [self getTfWithPlaceHolder:@"请输入负责人电话"];
[phoneTf valRule:ValidateRulePhoneNumber];
```
* 使用自定义校验规则校验TFUITextField，若校验不通过，返回NO：
```
UITextField *nameTf = [self getTfWithPlaceHolder:@"请输入姓名"];
BOOL val = nameTf.text.length >= 2 && nameTf.text.length <= 4;
BOOL result = [nameTf valBool:val alertStr:@"姓名长度2-4之间"];
```
* 校验字符串是否为空，若为空，返回NO：
```
BOOL result = [str valEmptyAlertStr:@"字符串为空"];
```
* 校验对象是否为空，若为空，返回NO：
```
BOOL result = [self.dataModel valEmptyAlertStr:@"dataModel为空"];
```
* 校验对象每个属性是否都已赋值，若有属性没有赋值，返回NO：
```
BOOL result = [self.dataModel isAll];
```
* 其他
```
若TF高度为0或为隐藏状态 则ZXFormValidate不会去校验
```
***
### 数据赋值（将当前控制器的全部UITextField赋值给Model模型，注意：model模型中的属性名顺序必须和控制器中UITextField顺序一致，赋值为1-1对应）
```
[self.dataModel dataAssInView:self.view];
```
***
### 数据填充，数据回显（将Model模型的值赋值给当前控制器的全部UITextField，注意：model模型中的属性名顺序必须和控制器中UITextField顺序一致，赋值为1-1对应）
```
[self.view dataAssWithModel:self.dataModel];
```
*** 
当您的表单来自于UITableView时
```
#import "TableViewTfsVC.h"
#import "TableViewTfCell.h"
#import "FixTfsModel.h"
@interface TableViewTfsVC ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSMutableArray *placeholdersArr;
@property (nonatomic, strong) NSArray *keysArr;
@property (nonatomic, strong) NSMutableDictionary *param;
@property (nonatomic, strong) NSMutableArray *tfs;

@property (nonatomic, weak) UITableView *tableView;
@end

@implementation TableViewTfsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"回显" style:UIBarButtonItemStylePlain target:self action:@selector(fillData)];
    [self setData];
    [self setTableView];
}

-(void)setData{
    _titleArr = @[@"负责人姓名",@"负责人电话",@"身份证号码",@"家庭住址",@"擅长方向", @"工作类型", @"银行卡号", @"性别", @"职位",@"曾用名",@"邮箱"];
    _placeholdersArr = [NSMutableArray array];
    for (NSString *titleStr in _titleArr) {
        [_placeholdersArr addObject:[NSString stringWithFormat:@"请输入%@",titleStr]];
    }
    [_placeholdersArr replaceObjectAtIndex:_placeholdersArr.count - 2 withObject:[NSString stringWithFormat:@"请输入%@(选填)",_titleArr[_placeholdersArr.count - 2]]];
    
    _keysArr = [[[[FixTfsModel alloc]init]getAllPropertyNames] mutableCopy];
    
    _param = [NSMutableDictionary dictionary];
    if([_isTfsVal integerValue]){
       //如果是根据TF数组校验 创建TF数组
        _tfs = [NSMutableArray array];
        for (NSString *placeholderStr in _placeholdersArr) {
            UITextField *tf = [[UITextField alloc]init];
            tf.frame = CGRectMake(105, 9, kScreenWidth - 105 - 30, 30);
            tf.placeholder = placeholderStr;
            [_tfs addObject:tf];
        }
    }
    
}
-(void)setTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavi_Height)];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 80)];
    UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commitBtn.frame = CGRectMake(15, 30, kScreenWidth - 30, 40);
    commitBtn.backgroundColor = [UIColor orangeColor];
    [commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:commitBtn];
    
    _tableView.tableFooterView = footView;
}

#pragma mark - Delegate
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewTfCell *cell = [[TableViewTfCell alloc]initWithTableView:tableView];
    cell.titleLabel.text = _titleArr[indexPath.row];
    UITextField *tf;
    if([_isTfsVal integerValue]){
        tf = _tfs[indexPath.row];
        [cell.contentView addSubview:tf];
        
    }else{
        tf = cell.textField;
        tf.placeholder = _placeholdersArr[indexPath.row];
    }
    tf.tag = indexPath.row;
    tf.delegate = self;
    //cell复用时必须重新赋值
    tf.text = [_param valueForKeyPath:_keysArr[indexPath.row]];
    return cell;
}
#pragma mark UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [_param setObject:textField.text forKey:_keysArr[textField.tag]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)commitBtnClick{
    if([_isTfsVal integerValue]){
        //根据Tf数组校验 其他形式校验方法参见FixTfsVC控制器
        if([_tfs valTfs]){
            [ZXToastTool showToast:@"校验通过"];
        }
        return;
    }
    
    NSMutableArray *keysArr = [_keysArr mutableCopy];
    NSMutableArray *placeholdersArr = [_placeholdersArr mutableCopy];
    //排除不需要检验的部分
    //因为keysArr是从FixTfsModel中获取的key 这边FixTfsModel末尾多了一个无用属性
    [keysArr removeObjectAtIndex:_keysArr.count - 3];
    [placeholdersArr removeObjectAtIndex:_placeholdersArr.count - 2];
    
    if([_param valWithKeysArr:keysArr placeholdersArr:placeholdersArr]){
        //可以进一步校验 使用字符串校验 自定义校验规则
        NSString *userName = _param[@"userName"];
        BOOL val  = userName.length >= 2 && userName.length <= 4;
        if([userName valBool:val alertStr:@"姓名长度2-4之间"]){
            [ZXToastTool showToast:@"校验通过"];
            //字典转模型 一般不需要转
            FixTfsModel *model = [FixTfsModel toModelWithDic:_param];
        }
    }
#warning 通过View校验适用于Cell较少的情况 必须保证Cell在任何情况下不会超过屏幕  这边请传self.tableView 请勿用self 或者 self.view
//    if([self.tableView valTfs]){
//
//    }
}
-(void)fillData{
    //数据回显
    //假数据。。
    NSArray *objs = @[@"张三",@"17720000000",@"411300200001044989",@"福建省福州市",@"程序员",@"发呆",@"6225365271562822",@"男",@"张四",@"软件开发",@"support@ifafu.cn",@""];
    _param = [NSMutableDictionary dictionaryWithObjects:objs forKeys:_keysArr];
    [_tableView reloadData];
}
```






