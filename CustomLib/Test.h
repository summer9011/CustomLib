//
//  Test.h
//  CustomLib
//
//  Created by 赵立波 on 14/11/22.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Test : NSManagedObject

@property (nonatomic, retain) NSString * t_uuid;
@property (nonatomic, retain) NSString * t_name;
@property (nonatomic, retain) NSString * t_pass;
@property (nonatomic, retain) NSString * t_phone;
@property (nonatomic, retain) NSString * t_address;

@end
