//
//  NSObject+Model.m

//
//  Created by HJQ on 2017/6/30.
//  Copyright © 2017年 HJQ. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/message.h>


@implementation NSObject (Model)

/**
 *  实现二级字典转模型
 */
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    // 创建对应的类对象
    id objc = [[self alloc] init];
    
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    
    for (NSInteger i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        
        // 获取成员名(以下划线开头 如: _name)
        NSString *propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 成员属性类型
        NSString *propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        // 成员属性的类型： _name --> @"NSString"
        // 去掉成名名的下划线 _name ==> name
        NSString *key = [propertyName substringFromIndex:1];
        
        id value = dict[key];
        
        // 1.二级转换,字典里的字典 如果是模型
        // 值是字典，成员变量的类型不是字典，才需要转化
        if ([value isKindOfClass:[NSDictionary class]] && ![propertyType containsString:@"NS"]) {
            
            // \" 看做一个字符，转义字符
            // 字符串截取   @"@\"User\""== @\"User\" ->  User\"
            // 去掉两边的引用号 \"
            NSRange range = [propertyType rangeOfString:@"\""];
            // 截取双引号 后面的东西
            propertyType = [propertyType substringFromIndex:range.location + range.length];
            // User\" -> User
            range = [propertyType rangeOfString:@"\""];
            propertyType = [propertyType substringToIndex:range.location];
            
            // 获取到转换的类
            Class modelClass = NSClassFromString(propertyType);
            if (modelClass) {
                // 递归
                value = [modelClass modelWithDict:value];
            }
        }
        
        // 2.字典里的数组
        if ([value isKindOfClass:[NSArray class]]) {
            // [propertyType isEqualToString:@"@\"NSArray\""]
            if ([self respondsToSelector:@selector(objectClassInArray)] && [self objectClassInArray] != nil) {
//                NSString *type = [self objectClassInArray][key];
//                Class modelClass = NSClassFromString(type);
                Class modelClass = [self objectClassInArray][key];
                NSMutableArray *modelArray = [NSMutableArray array];
                
                for (NSDictionary *dict in value) {
                    id model = [modelClass modelWithDict:dict];
                    [modelArray addObject:model];
                }
                value = modelArray;
            }
        }
        
        if (value) {
            // KVC赋值:不能传空的,字典中没有值，就不管了
            [objc setValue:value forKey:key];
        }
    }
    
    // 释放
    free(ivarList);
    return objc;
}


/**
 *  数组中的模型
 */

+ (NSDictionary *)objectClassInArray {
    return nil;
}

@end
