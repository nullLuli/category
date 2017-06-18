//
//  School.h
//  Category
//
//  Created by 李璐 on 2017/6/18.
//  Copyright © 2017年 李璐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface School : NSObject

@property(nonatomic,strong)NSArray<Person*>* grade1;

@property(nonatomic,strong)NSString * schoolName;
@end
