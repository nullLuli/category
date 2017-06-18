//
//  NSObject+Description.m
//  Category
//
//  Created by 李璐 on 2017/6/18.
//  Copyright © 2017年 李璐. All rights reserved.
//

#import "NSObject+Description.h"
#import <objc/message.h>

@implementation NSObject (Description)
-(NSString *)description
{
    NSString * result = [NSString stringWithFormat:@"<%p",self];
    //遍历属性，打印出属性地址
    Class c = self.class;
    int ivarCount;
    Ivar * ivars = class_copyIvarList(c, &ivarCount);
    for (int i = 0; i < ivarCount; i++) {
        id valueOfInstanceVariable = object_getIvar(self,ivars[i]);
        //该使用子类的description还是直接用属性地址？
        NSString * varClassName = [NSString stringWithUTF8String:object_getClassName(valueOfInstanceVariable)];
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        if ([self shouldLogAddress:varClassName]) {
            result = [result stringByAppendingString:[NSString stringWithFormat:@" %@:%p",key,valueOfInstanceVariable]];
        }
        else
        {
            result = [result stringByAppendingString:[NSString stringWithFormat:@" %@:%@",varClassName,[valueOfInstanceVariable description]]];
        }
    }
    result = [result stringByAppendingString:@">"];
    return result;
}

-(BOOL)shouldLogAddress:(NSString*)varClassName
{
//    NSLog(@"varClassName : %@",varClassName);

    NSArray * whiteList = @[@"__NSCF"];
    NSArray * blackList = @[@"__NSArrayM",@"__NSDictoryM",@"__NSArray",@"__NSDictory"];
    for (NSString * blackName in blackList) {
        if ([varClassName hasPrefix:blackName]) {
            return NO;
        }
    }
    for (NSString * whiteName in whiteList) {
        if ([varClassName hasPrefix:whiteName]) {
            return YES;
        }
    }
    return NO;
}
@end
