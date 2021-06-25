//
//  UIViewController+MTNaviBarItem.h
//  Memou
//
//  Created by Tom on 2021/6/22.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MTNaviBarItem)
- (UIButton*)mt_setNaviBaritemWithTitle:(NSString*)title color:(UIColor*)color Target:(id)target selector:(SEL)action ;
@end

NS_ASSUME_NONNULL_END
