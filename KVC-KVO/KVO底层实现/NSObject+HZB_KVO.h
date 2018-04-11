//
//  NSObject+HZB_KVO.h
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HZB_KVO)

- (void)Hzb_addObserver:(NSObject *_Nonnull)observer forKeyPath:(NSString *_Nonnull)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
