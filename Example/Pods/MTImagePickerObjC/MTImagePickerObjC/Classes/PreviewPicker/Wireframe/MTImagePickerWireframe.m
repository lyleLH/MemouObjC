//
//  MTImagePickerWireframe.m
//  MTImagePicker
//
//  Created by MTTGCC on 10/06/21.
//
//

#import "MTImagePickerWireframe.h"

#import "MTPopHelperView.h"
#import "MTPickerMenuView.h"
@interface MTImagePickerWireframe ()

@property (nonatomic, strong) MTPopHelperView* helperView ;
@property (nonatomic, strong) MTPickerMenuView * previewView;
@end

@implementation MTImagePickerWireframe

- (void)presentSelfFromViewController:(UIViewController *)viewController
{
    // save reference
    
    self.previewView= [[MTPickerMenuView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 368)];
    self.previewView.backgroundColor = [UIColor whiteColor];

    
    
    MTPopHelperView* helperView =   [[MTPopHelperView alloc]initWithFrame:[UIApplication sharedApplication].delegate.window.bounds];
    self.helperView = helperView;
    [[UIApplication sharedApplication].delegate.window  addSubview:helperView];
    
    [helperView showPopContentView:self.previewView];
    
    self.previewView.eventHandler = self.presenter;
    self.presenter.userInterface = self.previewView;
   
    [self.presenter setUpViews];
}

- (void)hideMenu {
    [self.helperView hideContentView];
}



- (MTImagePickerPresenter *)presenter {
    if(!_presenter){
        MTImagePickerPresenter *presenter = [[MTImagePickerPresenter alloc] init];
        presenter.wireframe = self;
        _presenter = presenter;
    }
    return _presenter;
}


@end
