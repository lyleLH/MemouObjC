//
//  MTHomeView.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>

/**
 View interface for the Home module.
 */
@protocol MTHomeViewInputInterface <NSObject>
 

- (void)updateListWithData:(NSArray *)data;
@end


@protocol MTHomeViewOutputInterface <NSObject>

- (void)chooseImageButtonEvent;
 
- (void)updateImagesSortFromIndex:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;
 
- (void)clearButtonEvent;

- (void)startButtonEvent;

@end
