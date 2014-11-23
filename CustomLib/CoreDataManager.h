//
//  CoreDataManager.h
//  CustomLib
//
//  Created by 赵立波 on 14/11/20.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

/*
 1.设置项目为使用coredata，并且在AppDelegate中有管理coredata的属性
 2.在xxx.xcdatamodeld中创建数据库模型，并点击菜单栏 Editor-->CreateNSManagerObject SubClass 创建数据库实体类
 3.开始数据库调试，在控制台数据执行的SQL语句  点击菜单栏 Product-->Scheme-->Edit Scheme的Run选项，在Arguments Passed On Launch
   添加  -com.apple.CoreData.SQLDebug; 1; 2个属性
 4.根据不同的数据实体类import不同的模型
*/

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject 

//插入单条数据
+(NSError *)insertSingleData:(NSDictionary *)data ForEntityName:(NSString *)entityName;

//插入多条数据
+(NSError *)insertMultiData:(NSArray *)dataArr ForEntityName:(NSString *)entityName;

//查询
+(NSDictionary *)getDataForMatchString:(NSPredicate *)match AndEntityName:(NSString *)entityName;

//更新
+(NSError *)updateDataForMatchString:(NSPredicate *)match AndNewEntity:(NSDictionary *)newData AndEntityName:(NSString *)entityName;

//删除
+(NSError *)deleteDataForMatchString:(NSPredicate *)match AndEntityName:(NSString *)entityName;

@end
