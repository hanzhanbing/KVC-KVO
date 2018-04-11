//
//  NSObject+HZB_KVO.m
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import "NSObject+HZB_KVO.h"
#import "HZB_KVONotifying_Person.h"
#import <objc/runtime.h>

@implementation NSObject (HZB_KVO)

- (void)Hzb_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    // 修改isa指针(runtime) 系统的NSKVONotifying_Person这个类是动态生成的,我们直接手动创建
    object_setClass(self, [HZB_KVONotifying_Person class]);
    
    // 给对象动态添加属性.目的是保存observer,好在set方法里面拿到,调用Hzb_addObserver:forKeyPath:options:context:这个方法
    objc_setAssociatedObject(self, (__bridge const void *)(keyPath), observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
