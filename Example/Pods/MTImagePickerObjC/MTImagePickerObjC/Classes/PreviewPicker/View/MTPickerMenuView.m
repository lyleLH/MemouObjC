//
//  MTPickerMenuView.m
//  MTImagePicker
//
//  Created by Tom on 2021/6/13.
//

#import "MTPickerMenuView.h"
#import "MTPickerPreviewView.h"
#import <MTLayoutUtilityComponent/MTMasConstraintMaker.h>

@interface MTPickerMenuView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView* tableView;

@property (nonatomic,strong)MTPickerPreviewView*prewView;

@end

@implementation MTPickerMenuView

- (void)setEventHandler:(MTImagePickerPresenter *)eventHandler {
    _eventHandler = eventHandler;
}

- (void)reloadViewContent:(NSArray *)data {
    [self.prewView reloadCollecionViews:data];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self).left(0).right(0).top(0).bottom(0);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row ==0){
        return 200;
    }
    return 44;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.font =[UIFont systemFontOfSize:15];
    
    if(indexPath.row ==0){
        
        [cell.contentView addSubview:self.prewView];
        [self.prewView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.to(cell.contentView).left(0).right(0).top(0).bottom(0);
        }];
        
    }else if(indexPath.row ==1){
        cell.detailTextLabel.text = @"打开设备上的图片";
        
    }else if(indexPath.row ==2){
        cell.detailTextLabel.text = @"相机";
    }else if(indexPath.row ==3){
        cell.detailTextLabel.text = @"确定";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row ==3){
        [self mt_passEventName:@"menuConfirmSelected" fromObject:self withUserInfo:@{@"index":indexPath}];
    }
   
}
 


- (UITableView *)tableView {
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        [self addSubview:_tableView];
    }
    return _tableView;
}


- (MTPickerPreviewView *)prewView {
    if(!_prewView){
        _prewView = [[MTPickerPreviewView alloc] initWithFrame:CGRectZero];
        
    }
    return _prewView;
}

- (void)mt_passEventName:(NSString *)eventName fromObject:(id)obj withUserInfo:(NSDictionary *)userInfo {
    if([eventName isEqualToString:@"cellDidSelected"]){
        [self.eventHandler previewCollectionViewDidselected:userInfo[@"index"]];
    }else  if([eventName isEqualToString:@"menuConfirmSelected"]){
        [self.eventHandler menuTableViewViewDidselected:userInfo[@"index"]];
    }
   
}

@end
