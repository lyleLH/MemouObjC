//
//  MTImageNodeListView.m
//  Memou
//
//  Created by Tom.Liu on 2021/6/20.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTImageNodeListView.h"

#import "MTSortedTableNode.h"
#import "MTImageCellNode.h"
@interface MTImageNodeListView ()<ASTableDelegate,ASTableDataSource,MTSortedTableNodeDelegate>
@property(nonatomic, strong) UIButton *bgButton;
@property(nonatomic, strong) MTSortedTableNode *tableNode;
@property(nonatomic, strong) NSMutableArray *modelArray;
@end

@implementation MTImageNodeListView

- (void)reloadListWithData:(NSArray *)data {
    self.modelArray = [NSMutableArray arrayWithArray:data];
    
    
    [self.tableNode reloadData];
    if(self.modelArray.count ==0){
        self.tableNode.frame = CGRectZero;
    }else{
        [self.bgButton removeFromSuperview];
        self.tableNode.frame = self.bounds;
    }
}

- (UIButton *)bgButton {
    if(!_bgButton){
        _bgButton = [[UIButton alloc] initWithFrame:self.bounds];
        [_bgButton setImage:[UIImage imageNamed:@"selfie"] forState:UIControlStateNormal];
        [_bgButton setImage:[UIImage imageNamed:@"selfie"] forState:UIControlStateHighlighted];
        [_bgButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _bgButton;
}


- (void)click {
    [self mt_passEventName:@"pickerImage" fromObject:self withUserInfo:@{}];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if(self.modelArray.count ==0){
        [self addSubview:self.bgButton];
    }else{
        [self.bgButton removeFromSuperview];
    }
   
//    self.tableNode.frame = CGRectZero;
}



-(NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
    
}

-(ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
    MTImageCellModel *model = self.modelArray[indexPath.row];
    return ^{
        MTImageCellNode *videoCellNode = [[MTImageCellNode alloc] initWithModel:model];
        return videoCellNode;
        
    };
}

- (ASSizeRange)tableView:(ASTableView *)tableView constrainedSizeForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ASSizeRangeMake(CGSizeMake([UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.width/16) * 9),
                           CGSizeMake([UIScreen mainScreen].bounds.size.width, INFINITY));
    
}

- (BOOL)shouldBatchFetchForTableView:(ASTableView *)tableView {
    return YES;
}

- (void)tableNode:(MTSortedTableNode *)tableNode didMoveNodeFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    [self mt_passEventName:@"sortEvent" fromObject:self withUserInfo:@{@"from":fromIndexPath,@"to":toIndexPath}];
}

//- (void)insertNewRowsInTableView:(NSArray *)newAnimals {
//    NSInteger oldCount = self.modelArray.count;
//    [self.modelArray addObjectsFromArray:newAnimals];
////    [self.tableNode insertRowWithStart:oldCount NewCount:self.modelArray.count];
//
//}

- (NSMutableArray *)dataSourceArrayInTableNode:(MTSortedTableNode *)tableNode {
//    NSLog([self.modelArray description]);
    return  @[self.modelArray,@[]].mutableCopy;
}

//排序后的数组
- ( void )sortedDataSourceArray:(NSMutableArray*)datasource inTableNode:(MTSortedTableNode *)tableNode {
   
//    NSLog([datasource description]);
 
}






- (MTSortedTableNode *)tableNode {
    if(!_tableNode){
        MTSortedTableNode * tableNode = [[MTSortedTableNode alloc] initWithStyle:UITableViewStylePlain];
        tableNode.backgroundColor = [UIColor whiteColor];
        tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableNode.gestureEventHandler.delegate = self;
        tableNode.gestureEventHandler.sortDataSource = self;
        [self addSubnode:tableNode];
        
        tableNode.delegate = self;
        tableNode.dataSource = self;
        _tableNode = tableNode;
    }
    return _tableNode;
}



@end
