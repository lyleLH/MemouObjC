//
//  MTHomeInteractorProtocol.h
//  Memou
//
//  Created by Tom.Liu on 2021/6/20.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MTHomeInteractorOutputProtocol <NSObject>

- (void)allImagesPrepared:(NSArray<UIImage *>*)images;

@end

@protocol MTHomeInteractorInputProtocol <NSObject>
- (NSArray *)requestImageModels:(NSArray*)assets ;
- (void)saveSortedArray:(NSArray*)modelArray  ;
- (void)preparedImages;
@end


NS_ASSUME_NONNULL_END
