//
//  CustomFileManager.m
//  CustomLib
//
//  Created by 赵立波 on 14/11/23.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

#import "StringManager.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation StringManager

+(NSString *)MD5:(NSString *)str {
    return [StringManager MD5:str IsUpper:NO];
}

+(NSString *)MD5:(NSString *)str IsUpper:(BOOL)upper {
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    if (upper) {
        return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",result[0], result[1], result[2], result[3],result[4], result[5], result[6], result[7],result[8], result[9], result[10], result[11],result[12], result[13], result[14], result[15]];
    }else{
        return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",result[0], result[1], result[2], result[3],result[4], result[5], result[6], result[7],result[8], result[9], result[10], result[11],result[12], result[13], result[14], result[15]];
    }
}


#define DOCUMENTS_PATH @"test_doc"
#define CACHES_PATH @"test_cache"
#define TMP_PATH @"test_tmp"

+(NSString *)getHomeDirectory {
    return NSHomeDirectory();
}

+(NSString *)getDocumentsDirectory {
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingPathComponent:DOCUMENTS_PATH];
}

+(NSString *)getCachesDirectory {
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingPathComponent:CACHES_PATH];
}

+(NSString *)getTmpDirectory {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:TMP_PATH];
}

+(BOOL)createFilePathForPath:(NSString *)path {
    NSFileManager *manager=[NSFileManager defaultManager];
    BOOL isDir=YES;
    if(![manager fileExistsAtPath:path isDirectory:&isDir]){
        BOOL isCreate=[manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        if (!isCreate) {
            return NO;
        }
    }
    
    return YES;
}


@end
