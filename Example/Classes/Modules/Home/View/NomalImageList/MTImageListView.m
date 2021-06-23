//
//  MTImageListView.m
//  Memou
//
//  Created by Tom on 2021/6/19.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTImageListView.h"
#import "MySortedTableView.h"
#import "MTImageCell.h"

@interface MTImageListView ()<BaseSortedTableViewDelegate, BaseSortedTableViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) MySortedTableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MTImageListView




- (void)reloadListWithData:(NSArray *)data {
    self.dataArray = [NSMutableArray arrayWithArray:data];
    [self.tableView reloadData];
}




-(void)layoutSubviews {
    [super layoutSubviews];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self).left(0).right(0).top(0).bottom(0);
    }];
    self.tableView.mt_emptySetter.state = MTEmptySetterState_Empty;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


#pragma mark ========== UITableViewDelegate ==========
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 205;
}


#pragma mark ========== BaseSortedTableViewDataSource ==========
- (NSMutableArray *)dataSourceArrayInTableView:(BaseSortedTableView *)tableView {
    return self.dataArray;
}
#pragma mark ========== BaseSortedTableViewDelegate ==========


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTImageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MTImageCell" forIndexPath:indexPath];
//    UIImage * image = self.dataArray[indexPath.row];
    PHAsset * asset = self.dataArray[indexPath.row];
//    [cell updateImage:asset];
    
    return cell;
    
}


- (MySortedTableView *)tableView {
    if (!_tableView) {
        _tableView = [[MySortedTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        _tableView.baseDelegate = self;
        _tableView.baseDataSource = self;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"MTImageCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MTImageCell"];
        [self setupEmpty];
        [self addSubview:_tableView];
        
        
    }
    return _tableView;
}

- (void)setupEmpty {
    //设置空白状态配置
    MTGeneralEmptySetter *emptySetter = [[MTGeneralEmptySetter alloc] init];
 
    //无数据状态配置
    [emptySetter setTitle:@"还未选择照片哦" forState:MTEmptySetterState_Empty];
    [emptySetter setDescription:@"点击屏幕任意处选择照片" forState:MTEmptySetterState_Empty];
    UIImage * image =  [UIImage imageNamed:@"selfie"];
      
    [emptySetter setImage:image forState:MTEmptySetterState_Empty];
    
    [emptySetter setTapViewHandler:^(UIView * _Nonnull view) {
        [self mt_passEventName:@"pickerImage" fromObject:self withUserInfo:@{}];
        
    } forState:MTEmptySetterState_Empty];
    
    
    //禁止滚动
    emptySetter.scrollable = NO;
    
    
    emptySetter.verticalOffset = -roundf(self.tableView.frame.size.height/5);
    
    _tableView.mt_emptySetter = emptySetter;
}





- (NSMutableArray *)dataArray {
    if (!_dataArray) {
//        _dataArray = [NSMutableArray arrayWithObjects:@[@"cell1", @"cell2", @"cell3", @"cell4", @"cell5", @"cell6", @"cell7", @"cell8", @"cell9", @"cell10", @"cell11", @"cell12", @"cell13", @"cell14", @"cell15",@"cell16", @"cell17", @"cell18", @"cell19", @"cell20"].mutableCopy, nil];
        _dataArray = @[];
    }
    return _dataArray;
}

@end
