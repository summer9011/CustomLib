//
//  CustomFileManager.h
//  CustomLib
//
//  Created by 赵立波 on 14/11/23.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

/*
 该文件定义了一些加密算法，文件路径获取的方法，和文件管理的方法，其中路径获取需要根据实际项目自行配置
 */

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

/*==========================     字符加密MD5     ==========================*/

//MD5加密
+(NSString *)MD5:(NSString *)str;

//MD5加密，返回大写的字符串
+(NSString *)MD5:(NSString *)str IsUpper:(BOOL) upper;


/*==========================     字符加密DES     ==========================*/

//DES加密


//DES解密



/*==========================     路径获取     ==========================*/

//获取home目录路径
+(NSString *)getHomeDirectory;

//获取Documents目录路径
+(NSString *)getDocumentsDirectory;

//获取Caches目录路径
+(NSString *)getCachesDirectory;

//获取tmp目录路径
+(NSString *)getTmpDirectory;


/*==========================     文件管理     ==========================*/

//获取文件目录结构


//获取文件内容


//存储数据到文件


//删除文件



@end
