//
//  MTHomeInteractor.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTHomeInteractor.h"


@interface MTHomeInteractor ()

@end


@implementation MTHomeInteractor


- (NSArray *)requestImageModels:(NSArray*)assets {
    
    return [self.dataManager imageModesWithImages: [self.dataManager imagesWithAsset:assets]];
}

- (void)saveSortedArray:(NSArray *)modelArray {
    self.dataManager.sortedArray = modelArray;
}


- (void)prepareImages {
    [self.presenter allImagesPrepared:[self.dataManager imagesWithModelArray:self.dataManager.sortedArray]];
}




@end
