//
//  MTImagePreEditModuleInterface.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>

/**
 Module interface for the ImagePreEdit module.
 */
@protocol MTImagePreEditModuleInterface <NSObject>

@end

/**
 Module delegate for the ImagePreEdit module.
 */
@protocol MTImagePreEditModuleDelegate <NSObject>
- (void)sortedImages:(NSArray<UIImage *> *)images;
@end
