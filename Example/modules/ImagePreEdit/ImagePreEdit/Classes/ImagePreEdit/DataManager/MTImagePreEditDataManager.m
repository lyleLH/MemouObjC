//
//  MTImagePreEditDataManager.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTImagePreEditDataManager.h"

@interface MTImagePreEditDataManager()

@property (nonatomic,strong)NSArray *images;
@end

@implementation MTImagePreEditDataManager

- (void)saveImages:(NSArray *)images {
    _images = images;
}

- (NSArray*)savedImages{
    
    return _images;
}
@end
