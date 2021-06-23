//
//  MTImagePreEditInteractor.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTImagePreEditInteractor.h"
#import "MTImageStitcher.h"
#import "SZMergeResult.h"

@interface MTImagePreEditInteractor ()<MTImageStitchDelegate>
@property (nonatomic,strong)MTImageStitcher *stitcher;
@end

@implementation MTImagePreEditInteractor

- (void)stitchImages:(NSArray<UIImage *> *)images {
    
//    [self.presenter stitchedImagePrepared:[self.stitcher stitchImages:images resultTargetSize:CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT)]];
    [self.stitcher stitchImages:[self.dataManager savedImages]];
}

- (void)showResult:(SZMergeResult *)result {
    [self.presenter  stitchedImagePrepared:result.image];
}

- (MTImageStitcher *)stitcher {
    if(!_stitcher){
        MTImageStitcher *stitcher = [[MTImageStitcher alloc] init];
        stitcher.delegate = self;
        _stitcher = stitcher;
    }
    return _stitcher;
}



@end
