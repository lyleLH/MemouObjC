//
//  SZScrollView.h
//  SZStiching
//
//  Created by chenshaozhe on 2018/11/21.
//  Copyright © 2018年 chenshaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SZEditorView;
@interface SZScrollView : UIScrollView
@property (nonatomic, strong) NSArray<SZEditorView *> *editors;
@end
