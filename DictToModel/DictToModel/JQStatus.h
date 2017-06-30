//
//  JQStatus.h
//
//  Created by HJQ on 2017/6/30.
//  Copyright © 2017年 HJQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JQStatuses,JQUser,JQPic_Urls;
@interface JQStatus : NSObject


@property (nonatomic, strong) NSArray<JQStatuses *> *statuses;

@property (nonatomic, assign) NSInteger total_number;


@end

@interface JQStatuses : NSObject

@property (nonatomic, copy) NSString *source;

@property (nonatomic, assign) NSInteger reposts_count;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *created_at;

@property (nonatomic, strong) NSArray<JQPic_Urls *> *pic_urls;

@property (nonatomic, assign) NSInteger attitudes_count;

@property (nonatomic, copy) NSString *idstr;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, strong) JQUser *user;

@end

@interface JQUser : NSObject

@property (nonatomic, copy) NSString *profile_image_url;

@property (nonatomic, assign) BOOL vip;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger mbrank;

@property (nonatomic, assign) NSInteger mbtype;

@end

@interface JQPic_Urls : NSObject

@property (nonatomic, copy) NSString *thumbnail_pic;

@end

