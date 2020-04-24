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

//MARK: 设置左滑按钮的样式
- (void)setupSlideBtnWithEditingIndexPath:(NSIndexPath *)editingIndexPath {

    // 判断系统是否是 iOS13 及以上版本
    if (@available(iOS 13.0, *)) {
        for (UIView *subView in self.tableView.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"_UITableViewCellSwipeContainerView")] && [subView.subviews count] >= 1) {
                // 修改图片
                UIView *remarkContentView = subView.subviews.firstObject;
                [self setupRowActionView:remarkContentView];
            }
        }
        return;
    }
    
    // 判断系统是否是 iOS11 及以上版本
    if (@available(iOS 11.0, *)) {
        for (UIView *subView in self.tableView.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UISwipeActionPullView")] && [subView.subviews count] >= 1) {
                // 修改图片
                UIView *remarkContentView = subView;
                [self setupRowActionView:remarkContentView];
            }
        }
        return;
    }
    
    // iOS11 以下的版本
    JYShopCell *cell = [self.tableView cellForRowAtIndexPath:editingIndexPath];
    for (UIView *subView in cell.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")] && [subView.subviews count] >= 1) {
            // 修改图片
            UIView *remarkContentView = subView;
            [self setupRowActionView:remarkContentView];
        }
    }
}

- (void)setupRowActionView:(UIView *)rowActionView {
    // 切割圆角
//    [rowActionView cl_setCornerAllRadiusWithRadiu:20];
    // 改变父 View 的frame，这句话是因为我在 contentView 里加了另一个 View，为了使划出的按钮能与其达到同一高度
    CGRect frame = rowActionView.frame;
    frame.origin.y += (7);
    frame.size.height -= (13);
    rowActionView.frame = frame;
    // 拿到按钮,设置
    UIButton *button = rowActionView.subviews.firstObject;
    [button setImage:[UIImage imageNamed:@"list_deleting"]  forState:UIControlStateNormal];
    [button setTitle:@"" forState:UIControlStateNormal];
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

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    dispatch_async(dispatch_get_main_queue(), ^{
          [self setupSlideBtnWithEditingIndexPath:indexPath];
      });
}



- (NSArray*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //title不设为nil 而是空字符串 理由为啥 ？   自己实践 跑到ios11以下的机器上就知道为啥了
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"        " handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        NSLog(@"哈哈哈哈");
        [tableView setEditing:NO animated:YES];  // 这句很重要，退出编辑模式，隐藏左滑菜单
    }];
    return @[deleteAction];
}

@end
