//
//  KVOUITableViewVC.m
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import "KVOUITableViewVC.h"

@interface KVOUITableViewVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *bgView;

@end

@implementation KVOUITableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarH, WIDTH, HEIGHT) style:UITableViewStylePlain];
    self.tableView.tableFooterView = [[UIView alloc] init]; //不显示没内容的cell
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    //添加监听者
    [self.tableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];
}

/**
 *  监听属性值发生改变时回调
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    CGFloat offset = self.tableView.contentOffset.y;
    CGFloat delta = offset / kNavBarH + 1.f;
    delta = MAX(0, delta);
    [self bgView].alpha = MIN(1, delta);
}

//移除观察者
- (void)dealloc {
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

//懒加载实现背景View
- (UIView*)bgView {
    if (_bgView == nil) {
        _bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, kNavBarH)];
        _bgView.backgroundColor = KNavBarColor;
        [self.navigationController.navigationBar setValue:_bgView forKey:@"backgroundView"];
    }
    return _bgView;
}

#pragma mark - UITableViewDelegate、UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
