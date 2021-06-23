//
//  MTImagePickerViewInterface.h
//  MTImagePicker
//
//  Created by Tom on 2021/6/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MTImagePickerViewInputInterface <NSObject>

- (void)reloadViewContent:(NSArray *)data;

@end


@protocol MTImagePickerViewOutputInterface <NSObject>

-(void)setUpViews;

- (void)previewCollectionViewDidselected:(NSIndexPath*)indexPath ;
- (void)menuTableViewViewDidselected:(NSIndexPath*)indexPath ;

@end

NS_ASSUME_NONNULL_END
