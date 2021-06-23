//
//  MemouConfig.h
//  Memou
//
//  Created by Tom on 06/19/2021.
//  Copyright (c) 2021 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  App全局内容配置
 */
@interface MemouConfig : NSObject

+ (MemouConfig *)sharedInstance;

#pragma mark
#pragma mark App

/**
 *  初始化app。(App主题,分页,服务器地址等配置)
 */
- (void)initApp;

#pragma mark
#pragma mark User

@property (nonatomic, strong, readonly) NSObject *currentUser;

/**
 *  更新用户信息,登录以后使用
 */
- (void)updateCurrentUser:(NSObject *)model;

/**
 *  清理用户
 */
- (void)clearCurrentUser;

@end
