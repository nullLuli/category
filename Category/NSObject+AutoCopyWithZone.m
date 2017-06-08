//
//  NSObject+AutoCopyWithZone.m
//  AutoCopyWithZone
//
//  Created by 李璐 on 2017/6/7.
//  Copyright © 2017年 李璐. All rights reserved.
//

#import "NSObject+AutoCopyWithZone.h"
#import <objc/runtime.h>

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
            
            id value = [self valueForKey:key];
            
            [result setValue:value forKey:key];
            
        }
        c = [c superclass];
        free(ivars);
    }
    return result;
}

@end
