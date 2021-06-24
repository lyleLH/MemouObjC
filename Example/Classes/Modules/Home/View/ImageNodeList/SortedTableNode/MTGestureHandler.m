//
//  MTGestureHandler.m
//  Memou
//
//  Created by Tom on 2021/6/21.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTGestureHandler.h"
#import "MTSortedTableNode.h"
#define MovableCellAnimationTime 0.25
@interface MTGestureHandler ()
/**
 记录选择的cell的indexPath
 */
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

/**
 记录开始拖动时的cell的indexPath
 */
@property (nonatomic, strong) NSIndexPath *startIndexPath;
/**
 记录结束拖动时的cell的indexPath
 */
@property (nonatomic, strong) NSIndexPath *endIndexPath;
/**
 cell快照
 */
@property (nonatomic, strong) UIImageView *snapshot;

/**
 edgeScrollLink
 */
@property (nonatomic, strong) CADisplayLink *edgeScrollLink;

/**
 当前滑动速度
 */
@property (nonatomic, assign) CGFloat currentScrollSpeedPerFrame;


@end


@implementation MTGestureHandler

#pragma mark ========== 手势拖动开始 ==========
- (void)longPressGestureBegan:(UILongPressGestureRecognizer *)longPressGesture {
    //获取point
    CGPoint point = [longPressGesture locationInView:longPressGesture.view];
    //获取selectedIndexPath
    NSIndexPath *selectIndexPath = [self.tableNode indexPathForRowAtPoint:point];
    
    self.startIndexPath = selectIndexPath;
    self.selectedIndexPath = selectIndexPath;
    if (!selectIndexPath) {
        return;
    }
    //获取cell
    ASCellNode *cell = [self.tableNode nodeForRowAtIndexPath:selectIndexPath];
    
//    if (self.dataSource && [self.dataSource respondsToSelector:@selector(tableView:canMoveRowAtIndexPath:)]) {
//        //设置了不允许拖动的row时，给出动画提示
//        if (![self.dataSource tableView:self canMoveRowAtIndexPath:selectIndexPath]) {
//            CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"tranform.translation.x"];
//            shakeAnimation.duration = MovableCellAnimationTime;
//            shakeAnimation.values = @[@(-20), @(20), @(-10), @(10), @(0)];
//            [cell.layer addAnimation:shakeAnimation forKey:@"shake"];
//            //移动不允许移动的cell 在此方法中可做提醒之类操作
//            if (self.baseDelegate && [self.baseDelegate respondsToSelector:@selector(tableView:tryMoveUnmovableCellAtIndexPath:)]) {
//                [self.baseDelegate tableView:self tryMoveUnmovableCellAtIndexPath:selectIndexPath];
//            }
//            return;
//        }
//    }
 
    //startEdgeScroll
    if (self.canEdgeScrolled) {
        [self startEdgeScroll];
    }
//    //获取数据源
    if (self.sortDataSource && [self.sortDataSource respondsToSelector:@selector(dataSourceArrayInTableNode:)]) {
        self.tempDataSource = [self.sortDataSource dataSourceArrayInTableNode:self.tableNode];
    }
    //获取cell快照
    self.snapshot = [self snapshotViewWithInputView:cell.view];
    self.snapshot.frame = cell.frame;
    [self.tableNode.view addSubview:self.snapshot];
    //隐藏当前cell真身
    cell.hidden = YES;
    self.snapshot.layer.shadowColor = [UIColor grayColor].CGColor;
    self.snapshot.layer.masksToBounds = NO;
    self.snapshot.layer.cornerRadius = 0;
    self.snapshot.layer.shadowOffset = CGSizeMake(-5, 0);
    self.snapshot.layer.shadowOpacity = 0.4;
    self.snapshot.layer.shadowRadius = 5;
    //默认动画
    [UIView animateWithDuration:MovableCellAnimationTime animations:^{
//        self.snapshot.center = CGPointMake(self.snapshot.center.x,self.snapshot.center);
    }];
}


#pragma mark ========== 手势拖动中 ==========
- (void)longPressGestureChanged:(UILongPressGestureRecognizer *)longPressGesture {
    CGPoint point = [longPressGesture locationInView:longPressGesture.view];
    point = CGPointMake(self.snapshot.center.x, [self limitSnapshotCenterY:point.y]);
    //Let the screenshot follow the gesture 随手是移动self.snapshot
    self.snapshot.center = point;
    NSIndexPath *currentIndexPath = [self.tableNode indexPathForRowAtPoint:point];
    if (!currentIndexPath) {
        return;
    }
    ASCellNode *selectedCell = [self.tableNode nodeForRowAtIndexPath:self.selectedIndexPath];
    selectedCell.hidden = YES;
//    if (self.dataSource && [self.dataSource respondsToSelector:@selector(tableView:canMoveRowAtIndexPath:)]) {
//        if (![self.dataSource tableView:self canMoveRowAtIndexPath:currentIndexPath]) {
//            return;
//        }
//    }
    if (currentIndexPath && ![self.selectedIndexPath isEqual:currentIndexPath]) {
        //交换数据源和cell
        [self updateDataSourceAndCellFromIndexPath:self.selectedIndexPath toIndexPath:currentIndexPath];
        if (self.delegate && [self.delegate respondsToSelector:@selector(tableNode:didMoveNodeFromIndexPath:toIndexPath:)]) {
            [self.delegate tableNode:self.tableNode didMoveNodeFromIndexPath:self.selectedIndexPath toIndexPath:currentIndexPath];
        }
        self.selectedIndexPath = currentIndexPath;
    }
}

#pragma mark ========== 手势拖动取消 ==========
- (void)longPressGestureCancelled:(UILongPressGestureRecognizer *)longPressGesture {
    CGPoint point = [longPressGesture locationInView:longPressGesture.view];
    point = CGPointMake(self.snapshot.center.x, [self limitSnapshotCenterY:point.y]);
    //Let the screenshot follow the gesture
    self.snapshot.center = point;
    NSIndexPath *currentIndexPath = [self.tableNode indexPathForRowAtPoint:point];
    self.endIndexPath = currentIndexPath;
    if (self.canEdgeScrolled) {
        [self stopEdgeScroll];
    }
 
    //获取刚才移动的cell
    ASCellNode *cell = [self.tableNode nodeForRowAtIndexPath:self.selectedIndexPath];
    [UIView animateWithDuration:MovableCellAnimationTime animations:^{
 
    } completion:^(BOOL finished) {
        //动画结束显示cell,并移除快照snapshot
        cell.hidden = NO;
        [self.snapshot removeFromSuperview];
        self.snapshot = nil;
    }];
}

- (void)updateDataSourceAndCellFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    if ([self.tableNode numberOfSections] == 1) {
        //only one section
        [self.tempDataSource[fromIndexPath.section] exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
        [self.tableNode moveRowAtIndexPath:fromIndexPath toIndexPath:toIndexPath];
        
      
        
    }else {
        //multiple sections
        id fromData = self.tempDataSource[fromIndexPath.section][fromIndexPath.row];
        id toData = self.tempDataSource[toIndexPath.section][toIndexPath.row];
        NSMutableArray *fromArray = self.tempDataSource[fromIndexPath.section];
        NSMutableArray *toArray = self.tempDataSource[toIndexPath.section];
        [fromArray replaceObjectAtIndex:fromIndexPath.row withObject:toData];
        [toArray replaceObjectAtIndex:toIndexPath.row withObject:fromData];
        
        if (@available(iOS 11.0, *)) {
            if (self.currentScrollSpeedPerFrame > 10) {
                [self.tableNode reloadRowsAtIndexPaths:@[fromIndexPath, toIndexPath] withRowAnimation:UITableViewRowAnimationNone];
            } else {//执行系统移动cell的行
                [self.tableNode performBatchUpdates:^{
                    [self.tableNode moveRowAtIndexPath:toIndexPath toIndexPath:fromIndexPath];
                    [self.tableNode moveRowAtIndexPath:fromIndexPath toIndexPath:toIndexPath];
                } completion:^(BOOL finished) {
                    
                }];
             
            }
        } else {//执行系统移动cell的行
            [self.tableNode performBatchUpdates:^{
                [self.tableNode moveRowAtIndexPath:toIndexPath toIndexPath:fromIndexPath];
                [self.tableNode moveRowAtIndexPath:fromIndexPath toIndexPath:toIndexPath];
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    if (self.sortDataSource && [self.sortDataSource respondsToSelector:@selector(sortedDataSourceArray:inTableNode:)]) {
        [self.sortDataSource sortedDataSourceArray:self.tempDataSource inTableNode:self.tableNode];
    }
}



#pragma mark ========== 创建cell快照 ==========
- (UIImageView *)snapshotViewWithInputView:(UIView *)inputView {
    //使用CGContext获取cell快照
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, 0);
    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *snapshot = [[UIImageView alloc] initWithImage:image];
    return snapshot;
}

#pragma mark ========== EdgeScroll边缘滚动 ==========
- (void)startEdgeScroll {
    self.edgeScrollLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(processEdgeScroll)];
    [self.edgeScrollLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopEdgeScroll {
    self.currentScrollSpeedPerFrame = 0;
    if (self.edgeScrollLink) {
        [self.edgeScrollLink invalidate];
        self.edgeScrollLink = nil;
    }
}



- (void)processEdgeScroll {
    CGFloat minOffsetY = self.tableNode.contentOffset.y + self.edgeScrollTriggerRange;
    CGFloat maxOffsetY = self.tableNode.contentOffset.y + self.tableNode.bounds.size.height - self.edgeScrollTriggerRange;
    CGPoint touchPoint = self.snapshot.center;
    
    if (touchPoint.y < minOffsetY) {
        //Cell is moving up
        CGFloat moveDistance = (minOffsetY - touchPoint.y)/self.edgeScrollTriggerRange*self.maxScrollSpeedPerFrame;
        self.currentScrollSpeedPerFrame = moveDistance;
        self.tableNode.contentOffset = CGPointMake(self.tableNode.contentOffset.x, [self limitContentOffsetY:self.tableNode.contentOffset.y - moveDistance]);
    }else if (touchPoint.y > maxOffsetY) {
        //Cell is moving down
        CGFloat moveDistance = (touchPoint.y - maxOffsetY)/self.edgeScrollTriggerRange*self.maxScrollSpeedPerFrame;
        self.currentScrollSpeedPerFrame = moveDistance;
        self.tableNode.contentOffset = CGPointMake(self.tableNode.contentOffset.x, [self limitContentOffsetY:self.tableNode.contentOffset.y + moveDistance]);
    }
    [self.tableNode setNeedsLayout];
    [self.tableNode layoutIfNeeded];
    
    [self longPressGestureChanged:self.longPressGesture];
}


- (CGFloat)limitContentOffsetY:(CGFloat)targetOffsetY {
    CGFloat minContentOffsetY;
    if (@available(iOS 11.0, *)) {
        minContentOffsetY = -self.tableNode.view.adjustedContentInset.top;
    } else {
        minContentOffsetY = -self.tableNode.contentInset.top;
    }
    
    CGFloat maxContentOffsetY = minContentOffsetY;
    CGFloat contentSizeHeight = self.tableNode.view.contentSize.height;
    if (@available(iOS 11.0, *)) {
        contentSizeHeight += self.tableNode.view.adjustedContentInset.top + self.tableNode.view.adjustedContentInset.bottom;
    } else {
        contentSizeHeight += self.tableNode.contentInset.top + self.tableNode.contentInset.bottom;
    }
    if (contentSizeHeight > self.tableNode.bounds.size.height) {
        maxContentOffsetY += contentSizeHeight - self.tableNode.bounds.size.height;
    }
    return MIN(maxContentOffsetY, MAX(minContentOffsetY, targetOffsetY));
}


- (CGFloat)limitSnapshotCenterY:(CGFloat)targetY {
    CGFloat minValue = self.snapshot.bounds.size.height*0.5 + self.tableNode.contentOffset.y;//最小
    CGFloat maxValue = self.tableNode.contentOffset.y + self.tableNode.bounds.size.height - self.snapshot.bounds.size.height*0.5;
    return MIN(maxValue, MAX(minValue, targetY));
}


@end
