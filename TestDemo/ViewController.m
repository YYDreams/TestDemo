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
@property (strong, nonatomic) NSIndexPath* editingIndexPath;  //当前左滑cell的index，在代理方法中设置

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
#pragma mark - viewDidLayoutSubviews
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    if (self.editingIndexPath){
        [self configSwipeButtons];
    }
}
#pragma mark - configSwipeButtons
- (void)configSwipeButtons{
    // 获取选项按钮的reference
    if (@available(iOS 11.0, *)){
    
        // iOS 11层级 (Xcode 9编译): UITableView -> UISwipeActionPullView
        for (UIView *subview in self.tableView.subviews)
        {
            NSLog(@"%@-----%zd",subview,subview.subviews.count);
            if ([subview isKindOfClass:NSClassFromString(@"UISwipeActionPullView")] && [subview.subviews count] >= 1)
            {
                // 和iOS 10的按钮顺序相反
                UIButton *deleteButton = subview.subviews[0];
                [self configDeleteButton:deleteButton];
            }
        }
    }
    else{
        // iOS 8-10层级 (Xcode 8编译): UITableView -> UITableViewCell -> UITableViewCellDeleteConfirmationView
        JYShopCell *tableCell = [self.tableView cellForRowAtIndexPath:self.editingIndexPath];
        for (UIView *subview in tableCell.subviews){
            NSLog(@"subview%@-----%zd",subview,subview.subviews.count);
            
            if ([subview isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")] && [subview.subviews count] >= 1)
            {
                UIButton *deleteButton = subview.subviews[0];
                [self configDeleteButton:deleteButton];
            }
        }
    }
}

- (void)configDeleteButton:(UIButton*)deleteButton{
    if (deleteButton) {
        [deleteButton setImage:[UIImage imageNamed:@"list_deleting"] forState:UIControlStateNormal];
        [deleteButton setBackgroundColor:[UIColor colorWithHexString:@"F2F2F2"]];

    }
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
    self.editingIndexPath = indexPath;
    [self.view setNeedsLayout];   // 触发-(void)viewDidLayoutSubviews
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.editingIndexPath = nil;
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
