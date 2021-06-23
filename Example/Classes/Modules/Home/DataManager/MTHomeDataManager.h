//
//  MTHomeDataManager.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>
#import "MTImageCellModel.h"
#import <Photos/Photos.h>

/**
 Data manager for the Home module.
 */
@interface MTHomeDataManager : NSObject

@property (nonatomic,strong)NSArray * sortedArray;
- (NSArray *)imagesWithAsset:(NSArray< PHAsset*>*)assets ;
- (NSArray*)imageModesWithImages:(NSArray<UIImage *>*)images ;
- (NSArray<UIImage*>*)imagesWithModelArray:(NSArray*)array ;
@end
