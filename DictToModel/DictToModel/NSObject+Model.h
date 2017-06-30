//
//  NSObject+Model.h
//
//  Created by HJQ on 2017/6/30.
//  Copyright © 2017年 HJQ. All rights reserved.
//

//  字典转模型

#import <Foundation/Foundation.h>

@interface NSObject (Model)

/**
 *  实现二级字典转模型
 */
+ (instancetype)modelWithDict:(NSDictionary *)dict;

/**
 *  数组中的模型
 */
+ (NSDictionary *)objectClassInArray;

@end
