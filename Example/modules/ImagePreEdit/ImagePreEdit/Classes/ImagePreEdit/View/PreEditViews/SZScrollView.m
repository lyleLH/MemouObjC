//
//  SZScrollView.m
//  SZStiching
//
//  Created by chenshaozhe on 2018/11/21.
//  Copyright © 2018年 chenshaozhe. All rights reserved.
//

#import "SZScrollView.h"
#import "SZEditorView.h"
//#import <UIView+YYAdd.h>
#import "UIView+YYAdd.h"
#define kSCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCALE_VALUE(value) ((value)*kSCREEN_WIDTH/375)
#define EDITORVIEW_SIZE SCALE_VALUE(30)

@implementation SZScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    for (SZEditorView *editorView in self.editors) {
        if (CGRectContainsPoint(CGRectMake((kSCREEN_WIDTH - EDITORVIEW_SIZE)/2, editorView.bottom - EDITORVIEW_SIZE/2, EDITORVIEW_SIZE, EDITORVIEW_SIZE), point)) {
            return YES;
        }
    }
    return [super pointInside:point withEvent:event];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    for (SZEditorView *editorView in self.editors) {
        if (CGRectContainsPoint(CGRectMake((kSCREEN_WIDTH - EDITORVIEW_SIZE)/2, editorView.bottom - EDITORVIEW_SIZE/2, EDITORVIEW_SIZE, EDITORVIEW_SIZE), point))  {
            return editorView.editorIcon;
        }
    }
    return [super hitTest:point withEvent:event];
}
@end
