//
//  TableViewTfCell.m
//  ZXFormValidateDemo
//
//  Created by 李兆祥 on 2018/8/16.
//  Copyright © 2018年 李兆祥. All rights reserved.
//

#import "TableViewTfCell.h"

@implementation TableViewTfCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}
-(instancetype)initWithTableView:(UITableView *)tableview{
    static NSString *ID;
    ID = NSStringFromClass([self class]);
    TableViewTfCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[[NSBundle mainBundle]loadNibNamed:ID owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
