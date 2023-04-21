//
//  MTImagePreEditWireframe.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTImagePreEditWireframe.h"
#import "MTImagePreEditViewController.h"
#import <MTCategoryComponent/MTCategoryComponentHeader.h>
#import <MTBaseKit/MTBaseKitHeader.h>
#import "MTImageStitcher.h"
#import <ServiceProtocols/ServiceProtocolsHeader.h>
@interface MTImagePreEditWireframe ()


@property (nonatomic, strong) MTImagePreEditViewController *viewController;

@property (nonatomic,strong) MTImageStitcher * stitcher ;
@end

@implementation MTImagePreEditWireframe

@MTModuleServiceRegister(){
    MTModuleServiceRegisterExecute(MTImagePreEditWireframe.class, @protocol(MMImageEditProtocol), nil);
}


+ (void)updateSelectedImages:(NSArray*)assets {
    MTImagePreEditWireframe * frame = [[MTImagePreEditWireframe alloc] init];
    MTImagePreEditPresenter *editPresenter = [[MTImagePreEditPresenter alloc] init];
    frame.viewController.eventHandler = editPresenter; 
    editPresenter.userInterface = frame.viewController;
    MTImagePreEditInteractor *editInteractor = [[MTImagePreEditInteractor alloc] init];
    editPresenter.interactor = editInteractor;
    editInteractor.presenter = editPresenter;
    MTImagePreEditDataManager *editDataManager = [[MTImagePreEditDataManager alloc] init];
    editDataManager.originalImages = assets;
    editInteractor.dataManager  = editDataManager;
    [[UIViewController mt_topViewController].navigationController pushViewController:frame.viewController animated:YES];
    
}

- (MTImagePreEditViewController *)viewController {
    if(!_viewController){
        _viewController = [[MTImagePreEditViewController alloc]init];
    }
    return _viewController;
}

@end
