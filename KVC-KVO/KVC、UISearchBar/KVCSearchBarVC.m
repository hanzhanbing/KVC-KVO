//
//  KVCSearchBarVC.m
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import "KVCSearchBarVC.h"

@interface KVCSearchBarVC ()<UISearchBarDelegate>
{
    UISearchBar *_searchBar;
}

@end

@implementation KVCSearchBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, kNavBarH+20, WIDTH-20, 44)];
    _searchBar.delegate = self;
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.showsCancelButton = YES;
    _searchBar.placeholder = @"KVC、UISearchBar";
    [self.view addSubview:_searchBar];
    
    //通过循环遍历出UISearchBar上所有展示出来的子视图
    [self getSubviewByEach];

    //通过KVC获取子视图
    [self getSubviewByKvc];

    //当我们获取cancelButton时，一定要确保cancelButton包含在了UISearchBar中，必要时可以提前调用：
    [_searchBar setShowsCancelButton:YES animated:NO];

    //去掉搜索框背景
    [self dismissSearchBarBackground];

    //去掉搜索框边框
    [self dismissSearchBarLayer];

    //改变输入框的样式
    [self changeSearchFieldStyle];

    //改变取消按钮的样式
    [self changeCancelBtnStyle];
}

#pragma mark - 通过循环遍历出UISearchBar上所有展示出来的子视图
- (void)getSubviewByEach {
    for (UIView *view in [[[_searchBar subviews] lastObject] subviews]) {
        
        if([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]){
            NSLog(@"UISearchBarBackground");
        }
        
        if([view isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            NSLog(@"UISearchBarTextField");
        }
        
        if([view isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            NSLog(@"UINavigationButton");
        }
    }
}

#pragma mark - 通过KVC获取子视图
- (void)getSubviewByKvc {
    UIView *backgroundView = [_searchBar valueForKey:@"_background"];
    
    UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
    
    UIButton *cancelButton = [_searchBar valueForKey:@"_cancelButton"];
}

#pragma mark - 去掉搜索框背景
- (void)dismissSearchBarBackground {
    for(UIView *view in[[[_searchBar subviews] lastObject] subviews]) {
        
        if([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            
            [view removeFromSuperview];
        }
    }
}

#pragma mark - 去掉搜索框边框
- (void)dismissSearchBarLayer {
    [_searchBar setBackgroundImage:[UIImage new]];
}

#pragma mark - 改变输入框的样式
- (void)changeSearchFieldStyle {
    UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
    
    [searchField setTextColor:[UIColor blackColor]];
    
    [searchField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [searchField setFont:[UIFont systemFontOfSize:14]];
    
    [searchField setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - 改变取消按钮的样式
- (void)changeCancelBtnStyle {
    UIButton *cancelButton = [_searchBar valueForKey:@"_cancelButton"];
    
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    
    [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
