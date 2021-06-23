//
//  MemouStringUtility.h
//  Memou
//
//  Created by Tom on 06/19/2021.
//  Copyright (c) 2021 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  字符串处理
 */
@interface MemouStringUtility : NSObject

/**
 *  格式化可能为nil的字符串
 *
 *  有时候需要往字典添加value.
 *
 *  @param emptyString
 *
 *  @return emptyString or @""
 */
+ (NSString *)formatEmptyString:(NSString *)emptyString;

@end
