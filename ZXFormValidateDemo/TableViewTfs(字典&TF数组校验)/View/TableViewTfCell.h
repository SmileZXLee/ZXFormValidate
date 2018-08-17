//
//  TableViewTfCell.h
//  ZXFormValidateDemo
//
//  Created by 李兆祥 on 2018/8/16.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewTfCell : UITableViewCell
-(instancetype)initWithTableView:(UITableView *)tableview;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end
