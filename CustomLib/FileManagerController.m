//
//  FileManagerController.m
//  CustomLib
//
//  Created by 赵立波 on 14/11/23.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

#import "FileManagerController.h"
#import "StringManager.h"

#import "AES.h"

@interface FileManagerController ()

@end

@implementation FileManagerController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//MD5加密
- (IBAction)doMD5:(id)sender {
    NSString *str=@"this is a test";
    NSString *md5str=[StringManager MD5:str];
    NSLog(@"%@",md5str);
}

//获取文件路径
- (IBAction)doGetDirectory:(id)sender {
    NSLog(@"home %@",[StringManager getHomeDirectory]);
    NSLog(@"documents %@",[StringManager getDocumentsDirectory]);
    NSLog(@"caches %@",[StringManager getCachesDirectory]);
    NSLog(@"tmp %@",[StringManager getTmpDirectory]);
}

//获取文件结构目录
- (IBAction)doCreatePath:(id)sender {
    NSString *path=[StringManager getDocumentsDirectory];
    BOOL isSuccess=[StringManager createFilePathForPath:[path stringByAppendingPathComponent:@"abc"]];
    if (isSuccess) {
        NSLog(@"create success");
    }else{
        NSLog(@"create error");
    }
}

- (IBAction)doEncode:(id)sender {
    NSString *str = @"from ios";
    
    //加密发送数据
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost/aes.php?data=%@", [AES AES128Encrypt:str]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //接受服务端处理数据
    NSURLResponse *response;
    NSError *error;
    NSData *base64Data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *base64Str = [[NSString alloc] initWithData:base64Data encoding:NSUTF8StringEncoding];
    
    //解密处理数据
    NSString *result = [AES AES128Decrypt:base64Str];
    
    NSLog(@"%@", result);
}

@end
