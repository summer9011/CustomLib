//
//  StorageObject.m
//  MHome
//
//  Created by apple on 15/9/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "StorageObject.h"

@implementation StorageObject

+ (id)createObjectForManagedObjectContext:(NSManagedObjectContext *)managedObjectContext entityName:(NSString *)entityName data:(NSDictionary *)dataDic {
    Class entityClass = NSClassFromString(entityName);
    
    id object = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:managedObjectContext];
    
    object = [self setObject:object class:entityClass properties:dataDic];
    
    //保存到sqlite
    NSError *error;
    [managedObjectContext save:&error];
    
    if (error != nil) {
        NSLog(@"StorageObject createObjectForManagedObjectContext: error %@", [error localizedDescription]);
        
        return nil;
    }
    
    return object;
}

+ (NSArray *)modifyObjectForManagedObjectContext:(NSManagedObjectContext *)managedObjectContext entityName:(NSString *)entityName predicate:(NSPredicate *)predicate data:(NSDictionary *)dataDic {
    NSArray *fetchResults = [self resultsForManagedObjectContext:managedObjectContext entityName:entityName predicate:predicate sortDescriptor:nil];
    
    Class entityClass = NSClassFromString(entityName);
    
    for (id resultObject in fetchResults) {
        [self setObject:resultObject class:entityClass properties:dataDic];
    }
    //保存到sqlite
    NSError *error;
    [managedObjectContext save:&error];
    
    if (error != nil) {
        NSLog(@"StorageObject modifyObject error %@", [error localizedDescription]);
        
        return nil;
    }
    
    return fetchResults;
}

+ (BOOL)deleteObject:(id)object managedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    [managedObjectContext deleteObject:object];
    
    NSError *error;
    BOOL isSave = [managedObjectContext save:&error];
    
    if (error != nil) {
        NSLog(@"StorageObject deleteObject error %@", [error localizedDescription]);
    }
    
    return isSave;
}

+ (NSArray *)resultsForManagedObjectContext:(NSManagedObjectContext *)managedObjectContext entityName:(NSString *)entityName predicate:(NSPredicate *)predicate sortDescriptor:(NSArray *)sortDescriptorArr {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext];
    
    fetchRequest.predicate = predicate;
    fetchRequest.entity = entity;
    
    if (sortDescriptorArr != nil) {
        fetchRequest.sortDescriptors = sortDescriptorArr;
    }
    
    NSError *error;
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error != nil) {
        NSLog(@"StorageObject resultsForManagedObjectContext: error %@", [error localizedDescription]);
        
        return nil;
    }
    
    return results;
}

+ (id)setObject:(id)object class:(Class)classObj properties:(NSDictionary *)propertiesDic {
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(classObj, &propertyCount);
    
    for (int i = 0; i < propertyCount; i ++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *nameStr = [NSString stringWithUTF8String:propertyName];
        
        if (propertiesDic[nameStr]) {
            NSString *firstUppercaseStr = [nameStr substringWithRange:NSMakeRange(0, 1)].uppercaseString;
            
            NSString *setName = [NSString stringWithFormat:@"set%@%@:", firstUppercaseStr, [nameStr substringWithRange:NSMakeRange(1, nameStr.length - 1)]];
            
            SEL setMethod = NSSelectorFromString(setName);
            
            [object performSelectorOnMainThread:setMethod withObject:propertiesDic[nameStr] waitUntilDone:[NSThread isMainThread]];
        }
    }
    
    free(properties);
    
    return object;
}

@end
