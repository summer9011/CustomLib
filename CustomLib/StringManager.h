//
//  CustomFileManager.h
//  CustomLib
//
//  Created by 赵立波 on 14/11/23.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringManager : NSObject

/**
 *  MD5加密
 *
 *  @param str 原文
 *
 *  @return 密文
 */
+(NSString *)MD5:(NSString *)str;

/**
 *  MD5加密(大写)
 *
 *  @param str 原文
 *
 *  @return 大写密文
 */
+(NSString *)MD5:(NSString *)str IsUpper:(BOOL) upper;

/**
 *  获取home目录路径
 *
 *  @return 路径
 */
+(NSString *)getHomeDirectory;

/**
 *  获取Documents目录路径
 *
 *  @return 路径
 */
+(NSString *)getDocumentsDirectory;

/**
 *  获取Caches目录路径
 *
 *  @return 路径
 */
+(NSString *)getCachesDirectory;

/**
 *  获取tmp目录路径
 *
 *  @return 路径
 */
+(NSString *)getTmpDirectory;

/**
 *  创建文件路径
 *
 *  @param path 需要创建的路径
 *
 *  @return 是否创建成功
 */
+(BOOL)createFilePathForPath:(NSString *)path;


@end
