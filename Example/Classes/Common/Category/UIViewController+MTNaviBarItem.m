//
//  UIViewController+MTNaviBarItem.m
//  Memou
//
//  Created by Tom on 2021/6/22.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "UIViewController+MTNaviBarItem.h"

@implementation UIViewController (MTNaviBarItem)


 
- (UIButton *)mt_setNaviBaritemWithTitle:(NSString*)title color:(UIColor *)color Target:(id)target selector:(SEL)action {
 
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateDisabled];
    [button setTitleColor:[UIColor grayColor]  forState:UIControlStateDisabled];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
