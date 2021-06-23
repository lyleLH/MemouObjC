//
//  MTImagePreEditView.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>

/**
 View interface for the ImagePreEdit module.
 */

@protocol MTImagePreEditViewInputInterface <NSObject>

- (void)setUpPreEditViewWithImages:(NSArray<UIImage *>*)images;
- (void)updatePreviewWithImage:(UIImage *)image;
@end


@protocol MTImagePreEditViewOutputInterface <NSObject>

- (void)saveStitchImageToAlbum;
@end
