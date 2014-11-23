//
//  CoreDataManager.m
//  CustomLib
//
//  Created by 赵立波 on 14/11/20.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

#import <objc/runtime.h>
#import "CoreDataManager.h"
#import "AppDelegate.h"

/*=========  需要人为增加或修改  =========*/
#import "Test.h"

@interface CoreDataManager ()

@end

@implementation CoreDataManager

//获取AppDelegate的managedObjectContext
+ (NSManagedObjectContext *)getManagerObjectContextForAppDelegate {
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    return delegate.managedObjectContext;
}

#pragma mark - 插入数据

//插入单条数据
+(NSError *)insertSingleData:(NSDictionary *)data ForEntityName:(NSString *)entityName {
    NSManagedObjectContext *manager=[CoreDataManager getManagerObjectContextForAppDelegate];
    
    /*=========  需要人为增加或修改  =========*/
    //根据不同的entityName设置不同的类
    Test *test=(Test *)[NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:manager];
    
    for (NSString *key in data) {
        [test setValue:data[key] forKey:key];
    }
    
    NSError *error;
    BOOL isSave=[manager save:&error];
    if (!isSave) {
        return error;
    }
    
    return nil;
}

//插入多条数据
+(NSError *)insertMultiData:(NSArray *)dataArr ForEntityName:(NSString *)entityName {
    for (NSDictionary *data in dataArr) {
        NSError *error=[CoreDataManager insertSingleData:data ForEntityName:entityName];
        if (error) {
            return error;
        }
    }
    
    return nil;
}

#pragma mark - 查询数据

//查询数据
+(NSDictionary *)getDataForMatchString:(NSPredicate *)match AndEntityName:(NSString *)entityName {
    id a=[entityName class];
    NSLog(@"Class %@",a);
    
    NSManagedObjectContext *manager=[CoreDataManager getManagerObjectContextForAppDelegate];
    
    NSFetchRequest *request=[[NSFetchRequest alloc] init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:entityName inManagedObjectContext:manager];
    [request setEntity:entity];
    
    [request setPredicate:match];
    
    NSError *error;
    NSMutableArray *fetchResults=(NSMutableArray *)[manager executeFetchRequest:request error:&error];
    if (error) {
        return @{@"error":[NSNumber numberWithInt:1],@"data":error};
    }else{
        
        /*=========  需要人为增加或修改  =========*/
        //将结果集转换为实体类，再返回
        NSMutableArray *resultsArr=[[NSMutableArray alloc] init];
        for (Test *fetch in fetchResults) {
            NSDictionary *dic=@{@"t_uuid":fetch.t_uuid,@"t_name":fetch.t_name,@"t_pass":fetch.t_pass,@"t_phone":fetch.t_phone,@"t_address":fetch.t_address};
            [resultsArr addObject:dic];
        }
        
        return @{@"error":[NSNumber numberWithInt:0],@"data":resultsArr,@"count":[NSNumber numberWithInteger:[resultsArr count]]};
    }
    
}

#pragma mark - 更新数据

//更新数据
+(NSError *)updateDataForMatchString:(NSPredicate *)match AndNewEntity:(NSDictionary *)newData AndEntityName:(NSString *)entityName {
    NSManagedObjectContext *manager=[CoreDataManager getManagerObjectContextForAppDelegate];
    
    NSFetchRequest *request=[[NSFetchRequest alloc] init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:entityName inManagedObjectContext:manager];
    [request setEntity:entity];
    [request setPredicate:match];
    
    NSError *error;
    NSMutableArray *fetchResults=(NSMutableArray *)[manager executeFetchRequest:request error:&error];
    if (error) {
        return error;
    }else{
        /*=========  需要人为增加或修改  =========*/
        //将新数据设置到实体类中
        for (Test *fetch in fetchResults) {
            for (NSString *key in newData) {
                [fetch setValue:newData[key] forKey:key];
            }
        }
        
        //更新实体
        BOOL isUpdate=[manager save:&error];
        if (!isUpdate) {
            return error;
        }
    }
    
    return nil;
}

//删除
+(NSError *)deleteDataForMatchString:(NSPredicate *)match AndEntityName:(NSString *)entityName {
    NSManagedObjectContext *manager=[CoreDataManager getManagerObjectContextForAppDelegate];
    
    NSFetchRequest *request=[[NSFetchRequest alloc] init];
    NSEntityDescription *entity=[NSEntityDescription entityForName:entityName inManagedObjectContext:manager];
    [request setEntity:entity];
    [request setPredicate:match];
    
    NSError *error;
    NSMutableArray *fetchResults=(NSMutableArray *)[manager executeFetchRequest:request error:&error];
    if (error) {
        return error;
    }else{
        /*=========  需要人为增加或修改  =========*/
        //删除匹配的实体
        for (Test *fetch in fetchResults) {
            [manager deleteObject:fetch];
        }
        
        //删除后保存实体
        BOOL isDeleted=[manager save:&error];
        if (!isDeleted) {
            return error;
        }
    }
    
    return nil;
}

@end