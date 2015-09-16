//
//  ViewController.m
//  CustomLib
//
//  Created by 赵立波 on 14/11/20.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"

#import "AppDelegate.h"
#import "StorageObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - CoreData类操作

//插入
- (IBAction)doInsert:(id)sender {
    //单条数据插入
    NSDictionary *dic=@{@"t_uuid":@"abc",@"t_name":@"bobo",@"t_pass":@"123456",@"t_phone":@"13758114754",@"t_address":@"中国浙江宁波"};
    
    AppDelegate *dele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Test *test = [StorageObject createObjectForManagedObjectContext:dele.managedObjectContext entityName:@"Test" data:dic];
    
    NSLog(@"%@", test);
}

//查询
- (IBAction)doSelect:(id)sender {
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"t_name==%@",@"11"];
    
    AppDelegate *dele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSArray *results = [StorageObject resultsForManagedObjectContext:dele.managedObjectContext entityName:@"Test" predicate:predicate sortDescriptor:nil];
    
    NSLog(@"%@", results);
}

//更新
- (IBAction)doUpdate:(id)sender {
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"t_name==%@",@"44"];
    NSDictionary *newData=@{@"t_name":@"lulu",@"t_pass":@"111111",@"t_phone":@"13355693210"};
    
    AppDelegate *dele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSArray *modifyResults = [StorageObject modifyObjectForManagedObjectContext:dele.managedObjectContext entityName:@"Test" predicate:predicate data:newData];
    
    NSLog(@"%@", modifyResults);
}

//删除
- (IBAction)doDelete:(id)sender {
    AppDelegate *dele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    BOOL isSuccess = [StorageObject deleteObject:nil managedObjectContext:dele.managedObjectContext];
    
    NSLog(@"%d", isSuccess);
}

@end
