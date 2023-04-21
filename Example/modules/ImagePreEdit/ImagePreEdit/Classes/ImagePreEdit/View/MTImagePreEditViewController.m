//
//  MTImagePreEditViewController.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTImagePreEditViewController.h"
#import "MTImagesPreViewView.h"
#import "MTLayoutUtilityComponentHeader.h"
#import "MTCategoryComponentHeader.h"
@interface MTImagePreEditViewController ()
@property (nonatomic, strong) UIButton * confirmButton;
@property (nonatomic, strong) MTImagesPreEditView * preEditView;
@property (nonatomic, strong) MTImagesPreViewView * previewView;
@end

@implementation MTImagePreEditViewController

- (void)updateUserinterfacePreEditView:(SZImageGenerator*)generator {
    [self.preEditView configEditViewWithGenerator:generator];
}

- (void)updatePreviewWithImage:(UIImage *)image {
    [self.previewView showImageInView:image];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor mt_colorWithHex:0xFEF7E7];
    [self.eventHandler viewDidLoad];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat bottomY = 0.0;
    if (@available(iOS 11.0, *)) {
        if([UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom>0.0){
            bottomY = 20;
        }
    } else {
        // Fallback on earlier versions
    }

    [self.preEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self.view).left(0).top(0).right(0).bottom(45);
    }];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self.view).left(15).right(15).bottom(30);
        make.size.mas_equalTo(@(CGSizeMake(UIScreen.mainScreen.bounds.size.width-30, 30+bottomY)));
    }];
}
 
#pragma mark - MTImagePreEditViewInterface methods

// *** implement view_interface methods here

#pragma mark - Button event handlers

// ** handle UI events here

- (void)confirmAction {
    [self.eventHandler saveStitchImageToAlbum];
}


- (void)mt_passEventName:(NSString *)eventName fromObject:(id)obj withUserInfo:(NSDictionary *)userInfo {
    
}

- (MTImagesPreEditView *)preEditView {
    if(!_preEditView){
        MTImagesPreEditView * preEditView = [[MTImagesPreEditView alloc] init];
        _preEditView = preEditView;
        [self.view addSubview:_preEditView];
    }
    return _preEditView;
}


- (MTImagesPreViewView *)previewView {
    if(!_previewView){
        MTImagesPreViewView * previewView = [[MTImagesPreViewView alloc] init];
        _previewView = previewView;
        [self.view addSubview:_previewView];
    }
    return _previewView;
}



- (UIButton *)confirmButton {
    if(!_confirmButton){
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"确定" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor mt_colorWithHex:0xFFB071];
        button.layer.cornerRadius = 15;
        [button addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
        _confirmButton = button;
        [self.view addSubview:_confirmButton];
    }
    return _confirmButton;
}

@end
