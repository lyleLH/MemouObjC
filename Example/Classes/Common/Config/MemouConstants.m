//
//  MemouConstants.m
//  Memou
//
//  Created by Tom on 06/19/2021.
//  Copyright (c) 2021 Tom. All rights reserved.
//

#import "MemouConstants.h"

@implementation MemouConstants

#pragma mark
#pragma mark 分页信息 Page

+ (NSInteger)defaultStartPage
{
    return 1;
}

+ (NSInteger)defaultPageSize
{
    return 10;
}

+ (NSInteger)defaultMaxPageSize
{
    return 10000;
}

#pragma mark
#pragma mark 用户相关 Key

+ (NSString *)kUserIsLogin
{
    return @"MemouConstants_kUserIsLogin";
}

+ (NSString *)kUserAuthKey
{
    return @"MemouConstants_kUserAuthKey";
}

#pragma mark
#pragma mark UI配置

+ (UIColor *)colorMain
{
    return [UIColor lightGrayColor];
}

+ (UIColor *)colorBackGround
{
    return [UIColor colorWithRed:(CGFloat)0.416
                           green:(CGFloat)0.616
                            blue:(CGFloat)0.247
                           alpha:(CGFloat)1.0];
}

@end
