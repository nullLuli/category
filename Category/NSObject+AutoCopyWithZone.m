//
//  NSObject+AutoCopyWithZone.m
//  AutoCopyWithZone
//
//  Created by 李璐 on 2017/6/7.
//  Copyright © 2017年 李璐. All rights reserved.
//

#import "NSObject+AutoCopyWithZone.h"
#import <objc/message.h>

@implementation NSObject (AutoCopyWithZone)

- (id)copyWithZone:(nullable NSZone *)zone
{
    id result = [[[self class] allocWithZone:zone]init];
    
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(c, &count);
        for (int i = 0; i < count; i++) {
            
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
            
            id value = object_getIvar(self, ivars[i]);
            
            id valueCopy;
            
            if ([value isKindOfClass:[NSArray class]]) {
                valueCopy = [[[value class] alloc]initWithArray:value copyItems:YES];
            }
            else if ([value isKindOfClass:[NSDictionary class]]) {
                valueCopy = [[[value class] alloc]initWithDictionary:value copyItems:YES];
            }
            else
            {
                valueCopy = [value copy];
            }
            
            
            [result setValue:valueCopy forKey:key];
            
            NSLog(@"copy %@ in %@",key,NSStringFromClass(c));
        }
        c = [c superclass];
        free(ivars);
    }
    return result;
}

@end
