//
//  MTImagePreEditDataManager.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>

/**
 Data manager for the ImagePreEdit module.
 */
@interface MTImagePreEditDataManager : NSObject

@property (nonatomic,strong)NSArray * originalImages;
- (void)saveImages:(NSArray*)images;
- (NSArray*)savedImages;
@end
