//
//  ViewController.m
//  DictToModel
//
//  Created by HJQ on 2017/6/30.
//  Copyright © 2017年 HJQ. All rights reserved.
//

#import "ViewController.h"
#import "JQStatus.h"
#import "NSObject+Model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    
}

#pragma mark: - private methods
- (void)setupData {
    // 解析Plist
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSMutableArray *statuses = [NSMutableArray array];
    JQStatus *status = [JQStatus modelWithDict:dict];
    [statuses addObject:status];
    
    for (JQStatuses *md in status.statuses) {
        NSInteger idIndex = md.id;
        NSLog(@"%ld",idIndex);
    }
}

@end
