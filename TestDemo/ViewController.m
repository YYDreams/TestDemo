//
//  ViewController.m
//  TestDemo
//
//  Created by 花花 on 2017/10/21.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "ViewController.h"
#import "JYShopCell.h"
@interface ViewController ()

@end
static NSString *JYShopCellID = @"JYShopCellID";
@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"购物车Test";
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];

    
    [self setupTableView];
}

#pragma mark - setupTableView
- (void)setupTableView{
    

    [self.tableView registerNib:[UINib nibWithNibName:@"JYShopCell" bundle:nil] forCellReuseIdentifier:JYShopCellID];
    self.tableView.rowHeight = 140;

}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JYShopCell *cell = [tableView dequeueReusableCellWithIdentifier:JYShopCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imgView.image =[UIImage imageNamed:@"home_icon_meat"];
        cell.nameLabel.text = [NSString stringWithFormat:@"有机空心心心菜有机空心心心菜%zd",arc4random_uniform(50)];
        cell.count.text = [NSString stringWithFormat:@"%zd",arc4random_uniform(44)];
        cell.imgView.image = [UIImage imageNamed:@"home_icon_wine"];
        cell.priceLabel.text = [NSString stringWithFormat:@"￥%zd/个",arc4random_uniform(150)];
        cell.oldPriceLabel.text = [NSString stringWithFormat:@"￥%zd",arc4random_uniform(100000)];
        cell.explainTextField.text = [NSString stringWithFormat:@"对菜品的说明%zd",arc4random_uniform(150)];
    
    
   return cell;
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    for (UIView * view in cell.subviews) {
                NSLog(@"%@", view);
        
        if ([view isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")]) {
            NSLog(@"%zd",indexPath.row);
         
            
        }
    }
}


@end
