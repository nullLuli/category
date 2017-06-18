//
//  ViewController.m
//  Category
//
//  Created by 李璐 on 2017/6/8.
//  Copyright © 2017年 李璐. All rights reserved.
//

#import "ViewController.h"
#import "School.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testAutoCopy];
}

-(void)testAutoCopy
{
    School * sch = [self productSchool];
    School * schCopyed = [sch copy];
    BOOL isSchCopySuccess = sch == schCopyed ? NO:YES;
    BOOL isGradeArrayCopySuccess = sch.grade1 == schCopyed.grade1 ? NO:YES;
    BOOL isPersonCopySuccess = sch.grade1.firstObject == schCopyed.grade1.firstObject ? NO:YES;
    BOOL isPersonNameCopySuccess = sch.grade1.lastObject.name == schCopyed.grade1.lastObject.name ? NO:YES;
    NSLog(@"%@",sch);
    NSLog(@"%@",schCopyed);
//    NSLog(@"sch is equal : %d, grade is equal : %d,person is equal : %u,person name is equal : %d",isSchCopySuccess,isGradeArrayCopySuccess,isPersonCopySuccess,isPersonNameCopySuccess);
}

-(School*)productSchool
{
    School * sch = [[School alloc]init];
    sch.schoolName = @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    NSMutableArray<Person*>* personArray = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        Person * per = [[Person alloc]init];
        per.name = [NSString stringWithFormat:@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaPerson%d",i];
        per.age = @(i + 10);
        [personArray addObject:per];
    }
    sch.grade1 = personArray;
    return sch;
}
@end
