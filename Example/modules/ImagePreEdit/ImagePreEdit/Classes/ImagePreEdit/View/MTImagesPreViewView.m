//
//  MTImagesPreViewView.m
//  Memou
//
//  Created by Tom on 2021/6/23.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTImagesPreViewView.h"
#import "MTLayoutUtilityComponentHeader.h"

@interface MTImagesPreViewView ()
@property (nonatomic,strong)    UIScrollView    *scrollView;
@property (nonatomic,strong)    UIImageView     *imageView;
@property (nonatomic,strong)    UIImage         *image;
@property (nonatomic,assign)    CGSize          contentSize;
@end

@implementation MTImagesPreViewView

 
- (void)showImageInView:(UIImage *)image {
    
    self.imageView.image = image;
    _image = image;
    CGFloat scale = [[UIScreen mainScreen] scale];
    _contentSize = CGSizeMake(_image.size.width * _image.scale / scale, _image.size.height * _image.scale / scale);
    [self.scrollView setContentSize:_contentSize];
    CGFloat x = (self.bounds.size.width - _contentSize.width ) / 2;
    CGRect frame = CGRectMake(x, 0, _contentSize.width,_contentSize.height);
    [_imageView setFrame:frame];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self).left(0).top(0).right(0).bottom((0+10+50 ));
    }];

}

- (UIScrollView *)scrollView {
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        [_scrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        _scrollView.contentSize = _contentSize;
        _scrollView.scrollEnabled = YES;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

- (UIImageView *)imageView {
    if(!_imageView){
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.scrollView addSubview:_imageView];
    }
    return _imageView;
}

@end
