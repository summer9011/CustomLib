//
//  ViewController.m
//  CustomLib
//
//  Created by 赵立波 on 14/11/20.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import "CoreDataManager.h"

#define ENTITY_NAME @"Test"

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
    NSError *error=[CoreDataManager insertSingleData:dic ForEntityName:ENTITY_NAME];
    if (!error) {
        NSLog(@"insert success");
    }else{
        NSLog(@"insert error %@",error);
    }
    
    //多条数据插入
    NSDictionary *dic1=@{@"t_uuid":@"11",@"t_name":@"11",@"t_pass":@"123456",@"t_phone":@"13758114754",@"t_address":@"中国浙江宁波"};
    NSDictionary *dic2=@{@"t_uuid":@"22",@"t_name":@"22",@"t_pass":@"123456",@"t_phone":@"13758114754",@"t_address":@"中国浙江宁波"};
    NSDictionary *dic3=@{@"t_uuid":@"33",@"t_name":@"33",@"t_pass":@"123456",@"t_phone":@"13758114754",@"t_address":@"中国浙江宁波"};
    NSDictionary *dic4=@{@"t_uuid":@"44",@"t_name":@"44",@"t_pass":@"123456",@"t_phone":@"13758114754",@"t_address":@"中国浙江宁波"};
    NSArray *dataArr=@[dic1,dic2,dic3,dic4];
    
    NSError *error2=[CoreDataManager insertMultiData:dataArr ForEntityName:ENTITY_NAME];
    if (!error2) {
        NSLog(@"insert success");
    }else{
        NSLog(@"insert error %@",error2);
    }
    
}

//查询
- (IBAction)doSelect:(id)sender {
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"t_name==%@",@"11"];
    NSDictionary *matchData=[CoreDataManager getDataForMatchString:predicate AndEntityName:ENTITY_NAME];
//    NSLog(@"%@",matchData);
}

//更新
- (IBAction)doUpdate:(id)sender {
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"t_name==%@",@"44"];
    NSDictionary *newData=@{@"t_name":@"lulu",@"t_pass":@"111111",@"t_phone":@"13355693210"};
    
    NSError *error=[CoreDataManager updateDataForMatchString:predicate AndNewEntity:newData AndEntityName:ENTITY_NAME];
    if (!error) {
        NSLog(@"update success");
    }else{
        NSLog(@"update error %@",error);
    }
}

//删除
- (IBAction)doDelete:(id)sender {
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"t_name==%@",@"22"];
    NSError *error=[CoreDataManager deleteDataForMatchString:predicate AndEntityName:ENTITY_NAME];
    if (!error) {
        NSLog(@"delete success");
    }else{
        NSLog(@"delete error %@",error);
    }
}

@end
