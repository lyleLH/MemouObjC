//
//  MTImagePreEditViewController.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTImagePreEditViewController.h"

@interface MTImagePreEditViewController ()
@property (nonatomic, strong) MTImagesPreEditView * preEditView;
@end

@implementation MTImagePreEditViewController

- (void)setUpPreEditViewWithImages:(NSArray<UIImage *>*)images {
    [self.preEditView configEditViewWithImages:images];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor mt_colorWithHex:0xFEF7E7];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.preEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self.view).left(0).top(0).right(0).bottom(0);
    }];
}
 
#pragma mark - MTImagePreEditViewInterface methods

// *** implement view_interface methods here

#pragma mark - Button event handlers

// ** handle UI events here



- (MTImagesPreEditView *)preEditView {
    if(!_preEditView){
        MTImagesPreEditView * preEditView = [[MTImagesPreEditView alloc] init];
        _preEditView = preEditView;
        [self.view addSubview:_preEditView];
    }
    return _preEditView;
}


@end
