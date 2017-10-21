//
//  JYShopCell.h
//  JYFarm
//
//  Created by 花花 on 2017/10/16.
//  Copyright © 2017年 花花. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+HHAddition.h"
@interface JYShopCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIButton *selBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;

@property (weak, nonatomic) IBOutlet UIButton *minBtn;

@property (weak, nonatomic) IBOutlet UIButton *maxBtn;

@property (weak, nonatomic) IBOutlet UILabel *count;

@property (weak, nonatomic) IBOutlet UITextField *explainTextField;

@property (weak, nonatomic) IBOutlet UIView *bordView;


@property (nonatomic, copy) void (^pmBtnClick)(NSInteger tag,NSString *totalPrice);
@property (nonatomic, copy) void (^selectBtnClick)(BOOL isSelecteds);
@end
