//
//  KVOImplementVC.m
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import "KVOImplementVC.h"
#import "Person.h"
#import "NSObject+HZB_KVO.h"

@interface KVOImplementVC ()

@property (nonatomic,strong) Person *p;

@end

@implementation KVOImplementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    /**********************KVO底层实现***********************/
    
    _p = [[Person alloc] init];
    [_p Hzb_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - KVO底层实现
- (void)Hzb_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    NSLog(@"自己实现的KVO");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _p.age++;
}

- (void)dealloc {
    [_p removeObserver:self forKeyPath:@"age"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
