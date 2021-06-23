//
//  MTSortedTableNode.h
//  Memou
//
//  Created by Tom on 2021/6/21.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "MTGestureHandler.h"
NS_ASSUME_NONNULL_BEGIN

@interface MTSortedTableNode : ASTableNode

@property (nonatomic, strong) MTGestureHandler *gestureEventHandler;


@end

NS_ASSUME_NONNULL_END
