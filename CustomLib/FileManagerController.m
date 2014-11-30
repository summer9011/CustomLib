//
//  FileManagerController.m
//  CustomLib
//
//  Created by 赵立波 on 14/11/23.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

#import "FileManagerController.h"
#import "StringManager.h"

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

@end
