//
//  MTImagesPreEditView.m
//  Memou
//
//  Created by Tom on 2021/6/23.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTImagesPreEditView.h"
#import "SZScrollView.h"
#import "SZEditorView.h"
#import "SZStichingImageView.h"
#import "SZImageGenerator.h"
#import <UIView+YYAdd.h>


#define EDITOR_BAR_HEIGHT 5
#define MIN_HEIGHT 50

@interface MTImagesPreEditView ()

@property (nonatomic,strong)SZScrollView * scrollView;
@property (nonatomic, strong) SZImageGenerator *generator;
@property (nonatomic, strong) NSMutableArray <SZEditorView*>*editViews;
@property (nonatomic, strong) NSMutableArray <SZStichingImageView*>*imageViews;
 
@property (nonatomic,assign)  CGFloat          totoalHeight;

@end


@implementation MTImagesPreEditView



- (void)configEditViewWithGenerator:(SZImageGenerator*)generator {
    _generator = generator;
    [self configImageViews];
}

- (void)configImageViews{
    if (!_generator.infos.count) {
        return;
    }
    [self.editViews removeAllObjects];
//    self.scrollEnable = YES;
    __block NSInteger editTouchIndex = 0;
    kWeakSelf(self);
    for (NSInteger i = 0; i <= _generator.infos.count + 1; i ++) {
        SZEditorView *editorView = [SZEditorView new];
        editorView.touchBegan = ^(SZEditorView *editorView) {
            kStrongSelf(self);
//            self.scrollEnable = !editorView.editorIcon.isSelected;
//            self.scrollView.scrollEnabled = self.scrollEnable;
            for (SZEditorView *editor in self.editViews) {
                editor.editing = NO;
            }
            editorView.editing = YES;
            editTouchIndex = i;
        };
        [self.editViews addObject:editorView];
    }
    
//    [self.guideViews addObject:self.editViews[1]];
    
    //用于触发按钮事件
    self.scrollView.editors = self.editViews;
    
    SZImageMergeInfo *firstInfo = _generator.infos.firstObject;
    CGFloat firstImagescale = kSCREEN_WIDTH / firstInfo.firstImage.size.width;
    
    
    SZStichingImageView *lastImageView = [[SZStichingImageView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH-30, firstInfo.firstImage.size.height * firstImagescale)];
    
    lastImageView.image = firstInfo.firstImage;
    lastImageView.touchMove = ^(SZStichingImageView *stichingImageView, CGFloat offsetY) {
        kStrongSelf(self)
        //第一张图片，存在两种操作：点击的是最顶比的编辑条。点击的是第二条编辑条
        if (editTouchIndex == 0) {
           [self firstImageScrollUp:stichingImageView offsetY:offsetY];
        }else if(editTouchIndex == 1) {
            [self topImageScrollDown:stichingImageView offsetY:offsetY];
        }
    };
    
    lastImageView.touchEnd = ^(SZStichingImageView *stichingImageView) {
        kStrongSelf(self);
        if (editTouchIndex == 0) {
//            [UIView animateWithDuration:0.5 animations:^{
//                kStrongSelf(self);
//                stichingImageView.height = stichingImageView.height - stichingImageView.imageView.top;
//                stichingImageView.imageView.top = 0;
//                [self bottomFollow:stichingImageView  isFirstImage:YES];
//                [self updateEditorBarPosition];
//                [self updateScrollViewContentSize];
//                SZEditorView *lastEditorView = [self.editViews lastObject];
//                lastEditorView.bottom = self.scrollView.contentSize.height;
//            }];
        }else if(editTouchIndex == 1) {
//            [UIView animateWithDuration:0.5 animations:^{
//                kStrongSelf(self);
//                stichingImageView.imageView.top = 0;
//                stichingImageView.top = 0;
//                [self bottomFollow:stichingImageView isFirstImage:YES];
//                [self updateEditorBarPosition];
//                [self updateScrollViewContentSize];
//                SZEditorView *lastEditorView = [self.editViews lastObject];
//                lastEditorView.bottom = self.scrollView.contentSize.height;
//            }];
        }
    };
    
    //第一个编辑条
    SZEditorView *firstEditorView = self.editViews.firstObject;
    firstEditorView.firstImageView = nil;
    firstEditorView.lastImageView = lastImageView;
    firstEditorView.top = lastImageView.top ;
    firstEditorView.left = 0;
    firstEditorView.width = lastImageView.width;
    firstEditorView.height = EDITOR_BAR_HEIGHT;
    
    
    [self.scrollView addSubview:lastImageView];
    [self.scrollView addSubview:firstEditorView];
    [self.imageViews addObject:lastImageView];
    
    
    
    NSInteger index = 0;
    for (SZImageMergeInfo *info in _generator.infos) {
        CGFloat scale = kSCREEN_WIDTH / info.secondImage.size.width;
        CGFloat secondImageH = info.secondImage.size.height * scale;
        SZStichingImageView *imageView = [[SZStichingImageView alloc] initWithFrame:CGRectMake(0, lastImageView.bottom, kSCREEN_WIDTH-30, secondImageH)];
        imageView.image = info.secondImage;
         [self.scrollView addSubview:imageView];
        if (!info.error) {
            lastImageView.height = lastImageView.height - (info.firstOffset) * scale;
            imageView.top = lastImageView.bottom;
            imageView.height = (info.secondOffset) * scale;
            imageView.imageView.top = - secondImageH + (info.secondOffset) * scale;
        }
        SZEditorView *ediView = self.editViews[index + 1];
        ediView.firstImageView = [self.imageViews lastObject];
        ediView.lastImageView = imageView;
        ediView.left = 0;
        ediView.width = imageView.width;
        ediView.height = EDITOR_BAR_HEIGHT;
        ediView.bottom = lastImageView.bottom;
        [self.scrollView addSubview:ediView];
       
        
        lastImageView = imageView;
        [self.imageViews addObject:imageView];

        kWeakSelf(self);
        imageView.touchEnd = ^(SZStichingImageView *stichingImageView) {
            kStrongSelf(self);
//            BOOL isLastIndex = editTouchIndex == self.editViews.count - 1;
//            SZEditorView *editorView = self.editViews[editTouchIndex];
//            editorView.hidden = NO;
//            //为了避免边滚动，边更新self.scrollView.contentSize导致的动画不正常
//            if (isLastIndex) {
////                [UIView animateWithDuration:0.5 animations:^{
//                    [self updateScrollViewContentSize];
//                    //最后的编辑条，总是要在scrollView更新contentSize之后
//                    SZEditorView *lastEditorView = [self.editViews lastObject];
//                    lastEditorView.bottom = self.scrollView.contentSize.height;
////                }];
//            } else {
//                [self updateScrollViewContentSize];
//                //最后的编辑条，总是要在scrollView更新contentSize之后
//                SZEditorView *lastEditorView = [self.editViews lastObject];
//                lastEditorView.bottom = self.scrollView.contentSize.height;
//                NSLog(@"更新：%@",@(self.scrollView.contentSize.height));
//            }
        };
        
        imageView.touchMove = ^(SZStichingImageView *stichingImageView, CGFloat offsetY) {
            kStrongSelf(self);
//            NSInteger canMoveIndex = [self.imageViews indexOfObject:stichingImageView];
//            BOOL isAbove = canMoveIndex >= editTouchIndex;
//            BOOL isLastIndex = editTouchIndex == self.editViews.count - 1;
//            SZEditorView *editorView = self.editViews[editTouchIndex];
//            editorView.hidden = YES;
//            //获取点击的可编辑的editview
//             SZEditorView *ediView_ = self.editViews[editTouchIndex];
//            //滚动可编辑的上面一张图片
//            if (ediView_.firstImageView == stichingImageView && !isLastIndex) {
//                [self topImageScrollDown:stichingImageView offsetY:offsetY];
//
//                [self updateEditorBarPosition];
//            }
//            //滚动可编辑的下面的一张图片
//            else if (ediView_.lastImageView == stichingImageView  && !isLastIndex) {
//                [self belowImageScrollUp:stichingImageView offsetY:offsetY];
//
//                [self updateEditorBarPosition];
//            }
//            //滚动可编辑的图片之上的所有图片
//            else if (isAbove && !isLastIndex) {
//                SZStichingImageView *aboveStichingImageView = ediView_.lastImageView;
//                [self belowImageScrollUp:aboveStichingImageView offsetY:offsetY];
//
//                [self updateEditorBarPosition];
//            }
//            //滚动可编辑的图片之下的所有图片
//            else if (!isAbove && !isLastIndex) {
//                  SZStichingImageView *underStichingImageView = ediView_.firstImageView;
//                 [self topImageScrollDown:underStichingImageView offsetY:offsetY];
//
//                [self updateEditorBarPosition];
//            }
//            else if (isLastIndex) {
//                [self belowImageScrollUp:stichingImageView offsetY:offsetY];
//            }
 
        };
        index ++;
    }
    _totoalHeight = lastImageView.bottom;
    for (UIView *childView in self.scrollView.subviews.reverseObjectEnumerator) {
        [self.scrollView bringSubviewToFront:childView];
    }
    for (SZEditorView *editorView in self.editViews) {
        [self.scrollView bringSubviewToFront:editorView];
    }
    
    self.scrollView.contentSize = CGSizeMake(kSCREEN_WIDTH-30, _totoalHeight);
    
    //最后一个编辑条
    SZEditorView *lastEditorView = self.editViews.lastObject;
    lastEditorView.firstImageView = nil;
    lastEditorView.lastImageView = lastImageView;
    lastEditorView.left = 0;
    lastEditorView.width = lastImageView.width;
    lastEditorView.height = EDITOR_BAR_HEIGHT;
    lastEditorView.bottom = self.scrollView.contentSize.height;
    [self.scrollView addSubview:lastEditorView];
}

/*
 * 滚动第一张图片
 */
- (void)firstImageScrollUp:(SZStichingImageView *)stichingImageView offsetY:(CGFloat)offsetY {
    stichingImageView.imageView.top = stichingImageView.imageView.top  + offsetY;
    if ((stichingImageView.height <= MIN_HEIGHT) ||
        stichingImageView.height >= stichingImageView.imageView.bottom) {
        stichingImageView.imageView.top = stichingImageView.imageView.top - offsetY;
        stichingImageView.top = 0;
        return;
    }
   
}


/*
 * 滚动可编辑下面的图片
 */
- (void)belowImageScrollUp:(SZStichingImageView *)stichingImageView offsetY:(CGFloat)offsetY {
    stichingImageView.height = stichingImageView.height + offsetY;
    stichingImageView.imageView.top = stichingImageView.imageView.top  + offsetY;
    if (stichingImageView.imageView.top >= 0.0 || (stichingImageView.height <= MIN_HEIGHT)) {
        stichingImageView.height = stichingImageView.height - offsetY;
        stichingImageView.imageView.top = stichingImageView.imageView.top - offsetY;
        return;
    }
   
    //底部跟随
    [self bottomFollow:stichingImageView isFirstImage:NO];
}

/*
 * 底部跟随
 * stichingImageView 需要跟随谁的底部
 * isFirstImage 是否是第一张图片，如果是的画，底部所有的图片都会跟随
 */
- (void)bottomFollow:(SZStichingImageView *)stichingImageView isFirstImage:(BOOL) isFirstImage{
    SZStichingImageView *lastStichimageView = stichingImageView;
    NSInteger inlineIndex = [self.imageViews indexOfObject:stichingImageView];
    if ((inlineIndex + 1) < self.imageViews.count) {
        for (NSInteger i = inlineIndex + 1; i < self.imageViews.count; i ++) {
            SZStichingImageView *imageView = self.imageViews[i];
//            if (i == (inlineIndex + 1) && !isFirstImage) {
//                if (imageView.isEditing) {
//                    break;
//                }
//            }
            imageView.top = lastStichimageView.bottom;
            lastStichimageView = imageView;
        }
    }
}

/*
 * 顶部跟随
 * stichingImageView 需要跟随谁的顶部
 */
- (void)topFollow:(SZStichingImageView *)stichingImageView offsetY:(CGFloat) offsetY isLastImage:(BOOL) isLastImage{
    SZStichingImageView *lastStichimageView = stichingImageView;
    NSInteger inlineIndex = [self.imageViews indexOfObject:stichingImageView];
    if ((inlineIndex - 1) >= 0) {
        for (NSInteger i =  inlineIndex - 1 ; i >= 0; i --) {
            SZStichingImageView *imageView = self.imageViews[i];
//            if (i == (inlineIndex - 1) && !isLastImage) {
//                if (imageView.isEditing) {
//                    break;
//                }
//            }
            imageView.top = imageView.top + offsetY;
            lastStichimageView = imageView;
        }
    }
}


/*
 * 更新可编辑条的位置
 */
- (void)updateEditorBarPosition {
    NSInteger i = 0;
    SZEditorView *firstEditorView = [self.editViews firstObject];
    firstEditorView.top = 0;
    
    for (SZStichingImageView *imageView in self.imageViews) {
        if (i + 1 >= self.imageViews.count) {
            break;
        }
        SZEditorView *editorView = self.editViews[i + 1];
        editorView.bottom = imageView.bottom;
        i ++;
    }
    
//    [self updateScrollViewContentSize];
//    SZStichingImageView *bottomView = self.imageViews.lastObject;
//    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, bottomView.bottom);
//
//    //最后的编辑条，总是要在scrollView更新contentSize之后
//    SZEditorView *lastEditorView = [self.editViews lastObject];
//    lastEditorView.bottom = self.scrollView.contentSize.height;
//    NSLog(@"更新：%@",@(self.scrollView.contentSize.height));
}

- (void)updateScrollViewContentSize {
    CGFloat totalHeight = 0;
    for (SZStichingImageView *imageView in self.imageViews) {
        totalHeight += imageView.height;
    }
    self.scrollView.contentSize = CGSizeMake(kSCREEN_WIDTH-30, totalHeight);
}
/*
 * 滚动可编辑上面的图片
 */
- (void)topImageScrollDown:(SZStichingImageView *)stichingImageView offsetY:(CGFloat)offsetY {
    stichingImageView.height = stichingImageView.height - offsetY;
    if ((stichingImageView.height >= stichingImageView.imageView.bottom) ||
        (stichingImageView.height <= MIN_HEIGHT)) {
        stichingImageView.height = stichingImageView.imageView.bottom;
        return;
    }
    stichingImageView.top = stichingImageView.top + offsetY;
    
    //顶部跟随
    [self topFollow:stichingImageView offsetY:offsetY isLastImage:NO];
}

 
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self).left(15).top(kNAVGATIONBAR_HEIGHT+15).right(15).bottom((kIPhoneXSafeBottomMargin+10+50 ));
    }];
//    self.scrollView.contentSize = CGSizeMake(kSCREEN_WIDTH-30, kSCREEN_HEIGHT);
    
}

- (SZScrollView *)scrollView {
    if(!_scrollView){
        SZScrollView * scrollView = [[SZScrollView alloc] initWithFrame:CGRectZero];
        [scrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        scrollView.layer.cornerRadius = 10;
        scrollView.layer.shadowColor = [UIColor grayColor].CGColor;
        scrollView.layer.masksToBounds = NO;
        scrollView.layer.cornerRadius = 0;
        scrollView.layer.shadowOffset = CGSizeMake(-5, 0);
        scrollView.layer.shadowOpacity = 0.4;
        scrollView.layer.shadowRadius = 5;
        _scrollView = scrollView;
        
        [self addSubview:_scrollView];
    }
    return _scrollView;
}


- (NSMutableArray<SZEditorView *> *)editViews {
    if(!_editViews){
        _editViews = [NSMutableArray new];
    }
    return _editViews;
}
@end
