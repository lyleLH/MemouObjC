//
//  MTSortedTableNode.m
//  Memou
//
//  Created by Tom on 2021/6/21.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTSortedTableNode.h"

@interface MTSortedTableNode ()

@end


@implementation MTSortedTableNode


- (instancetype)initWithStyle:(UITableViewStyle)style {
    if(self == [super initWithStyle:style]){
        
        self.gestureEventHandler = [[MTGestureHandler alloc] init];
        self.gestureEventHandler.tableNode = self;
        self.gestureEventHandler.gestureMinimumPressDuration = 1.f;
        self.gestureEventHandler.canEdgeScrolled = YES;
        self.gestureEventHandler.edgeScrollTriggerRange = 150.f;
        self.gestureEventHandler.maxScrollSpeedPerFrame = 20;
        self.gestureEventHandler.longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self.view addGestureRecognizer: self.gestureEventHandler.longPressGesture];
     
        
        
    }
    return self;
}


 
#pragma mark ========== longPressGesture ==========
- (void)longPress:(UILongPressGestureRecognizer *)longPressGesture {
    switch (longPressGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            [self.gestureEventHandler longPressGestureBegan:longPressGesture];//开始
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self.gestureEventHandler longPressGestureChanged:longPressGesture];//变化中
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            [self.gestureEventHandler longPressGestureCancelled:longPressGesture];//取消
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [self.gestureEventHandler longPressGestureCancelled:longPressGesture];//和取消一样的操作
        }
            break;
            
        default:
            break;
    }
}






@end
