//
//  FileManagerController.m
//  CustomLib
//
//  Created by 赵立波 on 14/11/23.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

#import "FileManagerController.h"
#import "FileManager.h"

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
    NSString *md5str=[FileManager MD5:str];
    NSLog(@"%@",md5str);
}

//获取文件路径
- (IBAction)doGetDirectory:(id)sender {
    NSLog(@"home %@",[FileManager getHomeDirectory]);
    NSLog(@"documents %@",[FileManager getDocumentsDirectory]);
    NSLog(@"caches %@",[FileManager getCachesDirectory]);
    NSLog(@"tmp %@",[FileManager getTmpDirectory]);
}

@end
