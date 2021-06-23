//
//  MemouConfig.m
//  Memou
//
//  Created by Tom on 06/19/2021.
//  Copyright (c) 2021 Tom. All rights reserved.
//

#import "MemouConfig.h"

static MemouConfig *sharedInstance = nil;

@interface MemouConfig ()

@property (nonatomic, strong, readwrite) NSObject *currentUser;

@end

@implementation MemouConfig

+ (MemouConfig *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

#pragma mark
#pragma mark App

- (void)initApp
{
}

#pragma mark
#pragma mark User

- (void)updateCurrentUser:(NSObject *)model
{
    _currentUser = model;
}

- (void)clearCurrentUser
{
    _currentUser = nil;
}

@end
