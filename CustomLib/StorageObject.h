//
//  StorageObject.h
//  MHome
//
//  Created by apple on 15/9/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <objc/runtime.h>

@interface StorageObject : NSObject

/**
 *  插入新数据
 *
 *  @param managedObjectContext 上下文
 *  @param entityName           模型实体名
 *  @param dataDic              新对象的数据
 *
 *  @return 最新插入的对象
 */
+ (id)createObjectForManagedObjectContext:(NSManagedObjectContext *)managedObjectContext entityName:(NSString *)entityName data:(NSDictionary *)dataDic;

/**
 *  修改数据
 *
 *  @param managedObjectContext 上下文
 *  @param entityName           模型实体名
 *  @param predicate            匹配条件
 *  @param dataDic              对象的数据
 *
 *  @return 对象
 */
+ (NSArray *)modifyObjectForManagedObjectContext:(NSManagedObjectContext *)managedObjectContext entityName:(NSString *)entityName predicate:(NSPredicate *)predicate data:(NSDictionary *)dataDic;

/**
 *  删除数据
 *
 *  @param object               要删除的对象
 *  @param managedObjectContext 上下文
 *
 *  @return 是否插入成功
 */
+ (BOOL)deleteObject:(id)object managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

/**
 *  从CoreData中获取数据
 *
 *  @param managedObjectContext 上下文
 *  @param entityName           模型实体名
 *  @param predicate            匹配条件
 *  @param sortDescriptorArr    排序条件
 *
 *  @return 匹配的结果集
 */
+ (NSArray *)resultsForManagedObjectContext:(NSManagedObjectContext *)managedObjectContext entityName:(NSString *)entityName predicate:(NSPredicate *)predicate sortDescriptor:(NSArray *)sortDescriptorArr;

/**
 *  设置对象的属性数据
 *
 *  @param object        对象实例
 *  @param classObj      对象的类
 *  @param propertiesDic 对象属性所需的数据
 *
 *  @return 设置后的对象数据
 */
+ (id)setObject:(id)object class:(Class)classObj properties:(NSDictionary *)propertiesDic;

@end
