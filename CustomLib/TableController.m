//
//  TableController.m
//  CustomLib
//
//  Created by 赵立波 on 14/11/20.
//  Copyright (c) 2014年 赵立波. All rights reserved.
//

#import "TableController.h"

@interface TableController ()

@end

@implementation TableController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

@end
