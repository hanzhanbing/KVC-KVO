//
//  ViewController.m
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import "ViewController.h"
#import "KVC_KVO_VC.h"
#import "KVOImplementVC.h"
#import "KVCSearchBarVC.h"
#import "KVOUITableViewVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"KVC-KVO";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarH, WIDTH, HEIGHT) style:UITableViewStylePlain];
    self.tableView.tableFooterView = [[UIView alloc] init]; //不显示没内容的cell
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - lazy loading...

- (NSArray *)dataArr {
    if(_dataArr==nil)
    {
        _dataArr = @[@"KVC、KVO详解",@"KVO底层实现",@"KVC、UISearchBar",@"KVO、UITableView"];
    }
    return _dataArr;
}

#pragma mark - UITableViewDelegate、UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //取消选择状态
    
    NSString *title = self.dataArr[indexPath.row];
    
    if ([title isEqualToString:@"KVC、KVO详解"]) {
        
        KVC_KVO_VC *vc = [[KVC_KVO_VC alloc] init];
        vc.title = @"KVC、KVO详解";
        [self.navigationController pushViewController:vc animated:NO];
    }
    
    if ([title isEqualToString:@"KVO底层实现"]) {
        KVOImplementVC *vc = [[KVOImplementVC alloc] init];
        vc.title = @"KVO底层实现";
        [self.navigationController pushViewController:vc animated:NO];
    }
    
    if ([title isEqualToString:@"KVC、UISearchBar"]) {
        KVCSearchBarVC *vc = [[KVCSearchBarVC alloc] init];
        vc.title = @"KVC、UISearchBar";
        [self.navigationController pushViewController:vc animated:NO];
    }
    
    if ([title isEqualToString:@"KVO、UITableView"]) {
        KVOUITableViewVC *vc = [[KVOUITableViewVC alloc] init];
        vc.title = @"KVO、UITableView";
        [self.navigationController pushViewController:vc animated:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
