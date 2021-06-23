//
//  MemouStringUtility.m
//  Memou
//
//  Created by Tom on 06/19/2021.
//  Copyright (c) 2021 Tom. All rights reserved.
//

#import "MemouStringUtility.h"

@implementation MemouStringUtility

+ (NSString *)formatEmptyString:(NSString *)emptyString
{
    NSString *result = @"";
    if (emptyString != nil)
    {
        result = emptyString;
    }
    return [result copy];
}
@end
