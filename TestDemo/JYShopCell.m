//
//  JYShopCell.m
//  JYFarm
//
//  Created by 花花 on 2017/10/16.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "JYShopCell.h"

#import "UIView+HHAddition.h"
@implementation JYShopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.minBtn.layer.borderWidth =1.0;
    self.minBtn.layer.borderColor = [UIColor colorWithHexString:@"62C6B2"].CGColor;
    self.minBtn.layer.cornerRadius = self.minBtn.frame.size.width * 0.5;
    
    
    
    self.maxBtn.layer.borderWidth =1.0;
    self.maxBtn.layer.borderColor = [UIColor colorWithHexString:@"62C6B2"].CGColor;
    self.maxBtn.layer.cornerRadius = self.maxBtn.frame.size.width * 0.5;
    self.maxBtn.layer.masksToBounds = YES;
    
    
    self.bordView.layer.borderWidth = 1;
    self.bordView.layer.borderColor = [UIColor colorWithHexString:@"F2F2F2"].CGColor;
}

//ios11该方法失效 
//- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index {
//    [super insertSubview:view atIndex:index];
//
//    if ([view isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")]) {
//        view.top = 10;
//        view.height = self.height - 10;
//
//        for (UIButton *btn in view.subviews) {
//
//            if ([btn isKindOfClass:[UIButton class]]) {
//
//                [btn setBackgroundColor:[UIColor colorWithHexString:@"F2F2F2"]];
//
//                [btn setTitle:nil forState:UIControlStateNormal];
//
//                [btn setImage:[UIImage imageNamed:@"list_deleting"] forState:UIControlStateNormal];
//
//                [btn setTintColor:[UIColor whiteColor]];
//            }
//        }
//    }
//}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
