//
//  MTPopHelperView.m
//  MTImagePicker
//
//  Created by Tom.Liu on 2021/6/10.
//

#import "MTPopHelperView.h"
#import <pop/POP.h>
#import <MTLayoutUtilityComponent/MTLayoutCategoryheader.h>
#import <MTCategoryComponent/MTCategoryComponentHeader.h>

@interface MTPopHelperView ()
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIView *popContentView;
@end

@implementation MTPopHelperView


- (void)tapGesturedDetected:(UITapGestureRecognizer *)recognizer {
    [self hideContentView];
}

- (void)hideContentView {
    [UIView animateWithDuration:0.2f animations:^{
        
        self.bgView.alpha       = 0.f;
        self.popContentView.alpha     = 0.f;
        self.popContentView.transform = CGAffineTransformMakeTranslation(0, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)showPopContentView:(UIView*)view {
    [self.bgView setFrame:self.bounds];
    CGFloat height = view.frame.size.height+[UIScreen mt_safeBottomMargin];
    
    self.popContentView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame), CGRectGetWidth(self.frame),height)];
    self.popContentView.backgroundColor = [UIColor whiteColor];
    [self addSubview: self.popContentView];
    
    [self.popContentView  addSubview:view];

    [UIView animateWithDuration:0.3f animations:^{
        self.bgView.alpha = 0.25f;
    }];
    
    POPSpringAnimation *positionY = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionY.toValue             =  @(self.popContentView.frame.origin.y - self.popContentView.frame.size.height*0.5);
    positionY.dynamicsTension     = 1000;
    positionY.dynamicsMass        = 1.3;
    positionY.dynamicsFriction    = 10.3;
    positionY.springSpeed         = 20;
    positionY.springBounciness    = 10;
    
//    [positionY setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
//        NSLog(@"%@",NSStringFromCGRect(self.shareview.frame));
//    }];
    [self.popContentView.layer pop_addAnimation:positionY forKey:nil];
    
}

 
-(UIView *)bgView {
    if(!_bgView){
        UIView * bgView = [[UIView alloc] initWithFrame:CGRectZero];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = 0.0;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturedDetected:)];
        [bgView addGestureRecognizer:tapGesture];
        _bgView = bgView;
        [self addSubview: _bgView];
        
    }
    return _bgView;
}


 
@end
