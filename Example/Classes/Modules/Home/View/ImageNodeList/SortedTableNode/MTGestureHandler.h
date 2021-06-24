//
//  MTGestureHandler.h
//  Memou
//
//  Created by Tom on 2021/6/21.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MTSortedTableNode;



@protocol MTSortedTableNodeDelegate <NSObject>
- (void)tableNode:(MTSortedTableNode *_Nullable)tableNode didMoveNodeFromIndexPath:(NSIndexPath *_Nullable)fromIndexPath toIndexPath:(NSIndexPath *_Nullable)toIndexPath;

@end


@protocol MTSortedTableNodeDataSource <NSObject>
/**
 DataSource数据来源

 @param tableNode MTSortedTableNode
 @return 数据来源
 */
- (NSMutableArray *_Nullable)dataSourceArrayInTableNode:(MTSortedTableNode *_Nullable)tableNode;

//排序后的数组
- ( void )sortedDataSourceArray:(NSMutableArray*_Nullable)datasource inTableNode:(MTSortedTableNode *_Nullable)tableNode;

@end




NS_ASSUME_NONNULL_BEGIN

@interface MTGestureHandler : NSObject

@property (nonatomic,weak) MTSortedTableNode *tableNode;
@property (nonatomic,weak) id <MTSortedTableNodeDelegate>delegate;
@property (nonatomic,weak) id <MTSortedTableNodeDataSource> sortDataSource;

/**
 保存dateSource
 */
@property (nonatomic, strong) NSMutableArray *tempDataSource;


/**
 长按手势
 */
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;
/**
 长按手势最小生效时间
 */
@property (nonatomic, assign) CGFloat gestureMinimumPressDuration;


@property (nonatomic, assign) CGFloat maxScrollSpeedPerFrame;

/**
 是否可以屏幕边缘滑动
 */
@property (nonatomic, assign) BOOL canEdgeScrolled;
/**
 边缘滑动触发范围
 */
@property (nonatomic, assign) CGFloat edgeScrollTriggerRange;
/**
 最大滑动速度
 */



#pragma mark ========== 手势拖动开始 ==========
- (void)longPressGestureBegan:(UILongPressGestureRecognizer *)longPressGesture ;
#pragma mark ========== 手势拖动中 ==========
- (void)longPressGestureChanged:(UILongPressGestureRecognizer *)longPressGesture;

#pragma mark ========== 手势拖动取消 ==========
- (void)longPressGestureCancelled:(UILongPressGestureRecognizer *)longPressGesture ;



@end

NS_ASSUME_NONNULL_END
