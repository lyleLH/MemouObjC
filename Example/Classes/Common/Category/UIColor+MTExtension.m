//
//  UIColor+MTExtension.m
//  Memou
//
//  Created by Tom.Liu on 2021/2/22.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "UIColor+MTExtension.h"
#import <MTCategoryComponent/MTCategoryComponentHeader.h>

@implementation UIColor (MTExtension)

+ (UIColor *)mt_lightBlueBgColor {
    return  [UIColor mt_colorFromHexString:@"#E1EFFA"];
}

+ (UIColor *)mt_themeColor {
    return  [UIColor mt_colorFromHexString:@"#1F9EFF"];
}

+ (UIColor *)mt_colorFromHexString:(NSString *)hexString  {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
@end
