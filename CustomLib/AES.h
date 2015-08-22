//
//  AES.h
//  CustomLib
//
//  Created by 赵立波 on 15/8/22.
//  Copyright (c) 2015年 赵立波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AES : NSObject

+ (NSString *)AES128Encrypt:(NSString *)plainString;

+ (NSString *)AES128Decrypt:(NSString *)encryptedString;

@end
