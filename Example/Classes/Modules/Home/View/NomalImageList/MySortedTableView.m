//
//  MySortedTableView.m
//  wdySortedTableView
//
//  Created by Macmini on 2019/7/30.
//  Copyright © 2019 Macmini. All rights reserved.
//

#import "MySortedTableView.h"

@interface MySortedTableView ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MySortedTableView
- (void)setAttributes {
    [super setAttributes];
    self.longPressGesture.minimumPressDuration = 1.0;//长按手势最小生效时间
  
}
 
@end
