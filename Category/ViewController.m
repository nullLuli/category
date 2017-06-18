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
//    BOOL isSchCopySuccess = sch == schCopyed ? NO:YES;
//    BOOL isGradeArrayCopySuccess = sch.grade1 == schCopyed.grade1 ? NO:YES;
//    BOOL isPersonCopySuccess = sch.grade1.firstObject == schCopyed.grade1.firstObject ? NO:YES;
//    BOOL isPersonNameCopySuccess = sch.grade1.lastObject.name == schCopyed.grade1.lastObject.name ? NO:YES;
//    NSLog(@"sch is equal : %d, grade is equal : %d,person is equal : %u,person name is equal : %d",isSchCopySuccess,isGradeArrayCopySuccess,isPersonCopySuccess,isPersonNameCopySuccess);
    NSLog(@"%@",sch);
    NSLog(@"%@",schCopyed);
    sch.person.name = @"b";
    NSLog(@"schCopyed.person.name : %@",schCopyed.person.name);
    sch.grade1.firstObject.name = @"c";
    NSLog(@"schCopyed.grade1.firstObject.name : %@",schCopyed.grade1.firstObject.name);
    sch.grade1.firstObject.friendDict[@(1)].name = @"e";
    NSLog(@"sch.grade1.firstObject.friendDict[@(1)].name : %@",schCopyed.grade1.firstObject.friendDict[@(1)].name);
}

-(School*)productSchool
{
    School * sch = [[School alloc]init];
    sch.schoolName = @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    NSMutableArray<Person*>* personArray = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        Person * per = [self getPersonWith:i];
        [personArray addObject:per];
    }
    sch.grade1 = personArray;
    sch.person = [self getPersonWith:6];
    return sch;
}

-(Person*)getPersonWith:(int)i
{
    Person * per = [[Person alloc]init];
    per.name = [NSString stringWithFormat:@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaPerson%d",i];
    per.age = @(i + 10);
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    for (int j = 0; j < 3; j++) {
        Person * friend = [[Person alloc]init];
        friend.name = [NSString stringWithFormat:@"%d+%d",i,j];
        [dict setObject:friend forKey:@(j)];
    }
    per.friendDict = dict;
    return per;
}
@end
