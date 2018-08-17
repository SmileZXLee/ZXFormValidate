//
//  MainVC.m
//  ZXFormValidateDemo
//
//  Created by 李兆祥 on 2018/8/14.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "MainVC.h"
@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = [NSString stringWithFormat:@"%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleNameKey]];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
}

- (IBAction)startAction:(id)sender {
    NSArray *VCArr = @[@"FixTfsVC",@"TableViewTfsVC",@"TableViewTfsVC"];
    NSUInteger index = ((UIView *)sender).tag;
    UIViewController *VC = [[NSClassFromString(VCArr[index]) alloc]init];
    if(index == 2){
        [VC setValue:@1 forKey:@"isTfsVal"];
    }
    [self.navigationController pushViewController:VC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
