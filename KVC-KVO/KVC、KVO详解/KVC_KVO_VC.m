//
//  KVC_KVO_VC.m
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import "KVC_KVO_VC.h"
#import "Person.h"
#import "PersonWatcher.h"

@interface KVC_KVO_VC ()

@end

@implementation KVC_KVO_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    /**********************KVC、KVO详解***********************/
    
    //初始化hzb这个人
    Person *p = [[Person alloc] init];
    [p setValue:@"Jason_hzb" forKey:@"name"];
    [p setValue:@"丰台区" forKey:@"address"];
    
    //Jason_hzb把名字改成了hzb
    changeName(p, @"hzb");
    
    //初始化zyl这个人
    Person *spouse = [[Person alloc] init];
    [p setValue:spouse forKey:@"spouse"];
    [p setValue:@"zyl" forKeyPath:@"spouse.name"];
    
    //hzb与zyl结婚
    logMarriage(p);
    
    //给hzb这个人绑定观察者（KVO）
    PersonWatcher *watcher = [[PersonWatcher alloc] init];
    [watcher watchPersonForChangeOfAddress:p];
    
    //hzb的地址由丰台区改成朝阳区
    [p setValue:@"朝阳区" forKey:@"address"];
}

#pragma mark - KVC详解

void changeName(Person *p, NSString *newName) {
    NSString *originalName = [p valueForKey:@"name"];
    [p setValue:newName forKey:@"name"];
    NSLog(@"Changed %@'s name to: %@", originalName, newName);
}

void logMarriage(Person *p) {
    NSString *personsName = [p valueForKey:@"name"];
    NSString *spousesName = [p valueForKeyPath:@"spouse.name"];
    NSLog(@"%@ is happily married to %@", personsName, spousesName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
