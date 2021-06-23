//
//  MTHomeViewController.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTHomeViewController.h"
#import "MTImageListView.h"
#import "MTImageNodeListView.h"
@interface MTHomeViewController ()
@property (nonatomic,strong)MTImageListView * listView;
@property (nonatomic,strong)MTImageNodeListView * imageNodeListView;
@end

@implementation MTHomeViewController


- (void)updateListWithData:(NSArray *)data {
    [self.imageNodeListView reloadListWithData:data];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self mt_setNaviBaritemWithTitle:@"拼接" Target:self selector:@selector(startToStitch:)];
    self.view.backgroundColor = [UIColor mt_colorWithHex:0xFEF7E7];
}

- (void)startToStitch:(UIButton*)button{
    [self.eventHandler startToStitchImages];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.imageNodeListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self.view).left(0).right(0).top(0).bottom(0);
    }];
}

#pragma mark - MTHomeViewInterface methods

// *** implement view_interface methods here

#pragma mark - Button event handlers

// ** handle UI events here

- (void)mt_passEventName:(NSString *)eventName fromObject:(id)obj withUserInfo:(NSDictionary *)userInfo {
    if([eventName isEqualToString:@"arraySorted"]){
        [self.eventHandler sortedNewArray:userInfo[@"array"]];
    }else{
        [self.eventHandler clickToChooseImage];
    }
    
}


- (MTImageListView *)listView {
    if(!_listView){
        MTImageListView *listView  = [[MTImageListView alloc] init];
        _listView = listView;
        [self.view addSubview:listView];
    }
    return _listView;
}


- (MTImageNodeListView *)imageNodeListView {
    if(!_imageNodeListView){
        MTImageNodeListView *imageNodeListView  = [[MTImageNodeListView alloc] init];
        _imageNodeListView = imageNodeListView;
        [self.view addSubview:imageNodeListView];
    }
    return _imageNodeListView;
}


@end
