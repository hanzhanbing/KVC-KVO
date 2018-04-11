//
//  PersonWatcher.m
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import "PersonWatcher.h"
#import "Person.h"

@implementation PersonWatcher

-(void)watchPersonForChangeOfAddress:(Person *)p {
    _p = p;
    [p addObserver:self forKeyPath:@"address" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
}

// whenever an observed key path changes, this method will be called
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"address"]) {
        NSString *name = [object valueForKey:@"name"];
        NSString *oldAddress = change[@"old"];
        NSString *newAddress = change[@"new"];
        NSLog(@"%@'s old address is %@. rencently, he has a new address: %@", name, oldAddress, newAddress);
    }
}

-(void) dealloc {
    [_p removeObserver:self forKeyPath:@"address"];
}

@end
