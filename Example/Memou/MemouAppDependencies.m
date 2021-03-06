//
//  MemouAppDependencies.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MemouAppDependencies.h"
 
#import "MTRootWireframe.h"

#import "MTHomeWireframe.h"
#import "MTHomePresenter.h"
#import "MTHomeDataManager.h"
#import "MTHomeInteractor.h"

#import "MTImagePreEditWireframe.h"
#import "MTImagePreEditPresenter.h"
#import "MTImagePreEditInteractor.h"
#import "MTImagePreEditDataManager.h"

@interface MemouAppDependencies ()

@property (nonatomic, strong) MTHomeWireframe *homeWireframe;

@end


 

@implementation MemouAppDependencies

- (id)init {
    if ((self = [super init]))
    {
        [self configureDependencies];
    }

    return self;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    // *** present first wireframe here
    [self.homeWireframe presentSelfFromWindow:window];
   
}

- (void)configureDependencies
{
    

  
    // -----
    // root classes
    MTRootWireframe *rootWireframe = [[MTRootWireframe alloc] init];
    // *** add datastore

    // *** module initialization
    
    // Home module initialization
    self.homeWireframe = [[MTHomeWireframe alloc] init];
    self.homeWireframe.rootWireframe = rootWireframe;
    MTHomePresenter * presenter = [[MTHomePresenter alloc] init];
    self.homeWireframe.presenter = presenter;
    
    MTHomeInteractor * interactor = [[MTHomeInteractor alloc] init];
    presenter.interactor = interactor;
    presenter.wireframe = self.homeWireframe;
    MTHomeDataManager * dataManager = [[MTHomeDataManager alloc] init];
    interactor.dataManager = dataManager;
    interactor.presenter = presenter;
    
    // Edit module initialization
    MTImagePreEditWireframe *editWireframe = [[MTImagePreEditWireframe alloc] init];
    self.homeWireframe.editWireframe = editWireframe;
    
    MTImagePreEditPresenter *editPresenter = [[MTImagePreEditPresenter alloc] init];
    editWireframe.presenter   =editPresenter;
    
    presenter.editModuleDelegate = editPresenter;
    
    
    
    MTImagePreEditInteractor *editInteractor = [[MTImagePreEditInteractor alloc] init];
    editPresenter.interactor = editInteractor;
    editInteractor.presenter = editPresenter;
     
    MTImagePreEditDataManager *editDataManager = [[MTImagePreEditDataManager alloc] init];
    editInteractor.dataManager  =editDataManager;
    
}


@end
