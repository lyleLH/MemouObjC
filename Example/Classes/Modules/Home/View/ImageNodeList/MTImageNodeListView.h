//
//  MTImageNodeListView.h
//  Memou
//
//  Created by Tom.Liu on 2021/6/20.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTGestureHandler.h"
NS_ASSUME_NONNULL_BEGIN

@interface MTImageNodeListView : UIView <MTSortedTableNodeDataSource>

- (void)reloadListWithData:(NSArray *)data ;
@end

NS_ASSUME_NONNULL_END
