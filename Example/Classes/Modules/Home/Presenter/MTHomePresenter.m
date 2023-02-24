//
//  MTHomePresenter.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTHomePresenter.h"
#import <MTBaseKit/MTBaseKitHeader.h>
#import <ServiceProtocols/ServiceProtocolsHeader.h>
@interface MTHomePresenter ()
@end

@implementation MTHomePresenter


#pragma mark - MTHomeInteractorOutputProtocol methods

- (void)imagePicked:(NSArray<PHAsset *> *)assets {
    [self.userInterface updateListWithData:assets];
}

#pragma mark - MTHomeViewOutputInterface methods
- (void)chooseImageButtonEvent {
    [self.interactor openImagePickerToChooseImage:@[]];
}


- (void)updateImagesSortFromIndex:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    [self.interactor resortImagesWithFromIndexPath:fromIndexPath andToIndexPath:toIndexPath];
}

- (void)clearButtonEvent {
    
}

- (void)startButtonEvent {
    
    Class<MMImageEditProtocol> service = MTModuleServiceWithProtocol(@protocol(MMImageEditProtocol), nil);
    [service updateSelectedImages:self.interactor.dataManager.assets];
}





@end
