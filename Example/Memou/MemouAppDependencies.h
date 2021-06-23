//
//  MemouAppDependencies.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 Dependency hierarchy for the Memou project.
 */
@interface MemouAppDependencies : NSObject

 
//- (void)installRootViewController;
- (void)installRootViewControllerIntoWindow:(UIWindow *)window;

@end
