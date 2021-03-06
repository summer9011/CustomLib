//
//  AES.h
//  CustomLib
//
//  Created by 赵立波 on 15/8/22.
//  Copyright (c) 2015年 赵立波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AES : NSObject

/**
 *  AES加密
 *
 *  @param plainString 需要加密的文本
 *
 *  @return 加密后文本
 */
+ (NSString *)AES128Encrypt:(NSString *)plainString;

/**
 *  AES解密
 *
 *  @param encryptedString 密文
 *
 *  @return 解密后文本
 */
+ (NSString *)AES128Decrypt:(NSString *)encryptedString;

@end
