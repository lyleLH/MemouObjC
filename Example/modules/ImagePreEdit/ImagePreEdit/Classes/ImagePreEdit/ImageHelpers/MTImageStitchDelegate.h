//
//  MTImageStitchDelegate.h
//  Memou
//
//  Created by Tom on 2021/6/23.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class SZMergeResult;
@protocol MTImageStitchDelegate <NSObject>

- (void)showResult:(SZMergeResult *)result;

- (void)mergeBegin;

- (void)mergeEnd;
@end

NS_ASSUME_NONNULL_END
