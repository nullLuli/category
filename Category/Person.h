//
//  Person.h
//  Category
//
//  Created by 李璐 on 2017/6/18.
//  Copyright © 2017年 李璐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,strong)NSNumber * age;

@property(nonatomic,strong)NSString * name;

@property(nonatomic,strong)NSDictionary<NSNumber*,Person*>* friendDict;
@end
