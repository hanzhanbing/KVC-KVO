//
//  Person.h
//  KVC-KVO
//
//  Created by Jason on 2018/4/11.
//  Copyright © 2018年 hzb. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * KVC，即是指 [NSKeyValueCoding]，一个非正式的 Protocol，提供一种机制来间接访问对象的属性;
 * 通过查找对象里面key对应的属性(set、get)的名字，如果没有查找到，就会查找key对应的实例变量的名字_key、key。
 */
@interface Person : NSObject
{
    //成员变量
    NSString *_address;
    Person *spouse;
}

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger age;

@end
