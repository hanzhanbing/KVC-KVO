//
//  PersonWatcher.h
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface PersonWatcher : NSObject
{
    Person *_p;
}

-(void)watchPersonForChangeOfAddress:(Person *)p;

@end
