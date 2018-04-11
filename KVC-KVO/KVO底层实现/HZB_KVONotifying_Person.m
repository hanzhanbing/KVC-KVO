//
//  HZB_KVONotifying_Person.m
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import "HZB_KVONotifying_Person.h"
#import "NSObject+HZB_KVO.h"
#import <objc/runtime.h>

@implementation HZB_KVONotifying_Person

- (void)setAge:(NSInteger)age {
    id observer = objc_getAssociatedObject(self, @"age");
    if (observer && [observer respondsToSelector:@selector(Hzb_addObserver:forKeyPath:options:context:)]) {
        [observer Hzb_addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    }
    [super setAge:age];
}

@end
