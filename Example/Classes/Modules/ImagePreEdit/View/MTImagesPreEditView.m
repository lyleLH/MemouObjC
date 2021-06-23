//
//  MTImagesPreEditView.m
//  Memou
//
//  Created by Tom on 2021/6/23.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTImagesPreEditView.h"

@interface MTImagesPreEditView ()

@property (nonatomic,strong)UIScrollView * scrollView;

@end


@implementation MTImagesPreEditView



- (void)configEditViewWithImages:(NSArray<UIImage*>*)images {
    self.scrollView.contentSize = CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT);
    
}




- (void)layoutSubviews {
    [super layoutSubviews];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self).left(0).top(0).right(0).bottom(0);
    }];
}

- (UIScrollView *)scrollView {
    if(!_scrollView){
        UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        
        _scrollView = scrollView;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}


@end
