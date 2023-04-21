//
//  MTImagePreEditInteractorProtocol.h
//  Memou
//
//  Created by Tom on 2021/6/23.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SZImageGenerator;
@protocol MTImagePreEditInteractorOutputProtocol <NSObject>
- (void)stitchedImagePrepared:(UIImage *)image;
- (void)preEditImagePrepared:(SZImageGenerator*)generator;
@end


@protocol MTImagePreEditInteractorInputProtocol <NSObject>
- (void)stitchImages:(NSArray<UIImage *>*)images;
@end


NS_ASSUME_NONNULL_END
