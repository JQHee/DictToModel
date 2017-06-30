//
//  JQStatus.m
//
//  Created by HJQ on 2017/6/30.
//  Copyright © 2017年 HJQ. All rights reserved.
//

#import "JQStatus.h"

@implementation JQStatus

+ (NSDictionary *)objectClassInArray{
    return @{@"statuses" : [JQStatuses class]};
}
@end


@implementation JQStatuses

+ (NSDictionary *)objectClassInArray{
    return @{@"pic_urls" : [JQPic_Urls class]};
}

@end


@implementation JQUser

@end


@implementation JQPic_Urls

@end


