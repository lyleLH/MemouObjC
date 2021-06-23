//
//  MTImagePreEditPresenter.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTImagePreEditPresenter.h"

@implementation MTImagePreEditPresenter

#pragma mark - MTImagePreEditModuleInterface methods

// implement module interface here


#pragma mark -- MTImagePreEditModuleDelegate

- (void)sortedImages:(NSArray<UIImage *> *)images {
    [self.userInterface  setUpPreEditViewWithImages:images];
}

@end