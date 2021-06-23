//
//  MTImagePreEditInteractor.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTImagePreEditInteractor.h"
#import "MTImageStitcher.h"


@interface MTImagePreEditInteractor ()
@property (nonatomic,strong)MTImageStitcher *stitcher;
@end

@implementation MTImagePreEditInteractor

- (void)stitchImages:(NSArray<UIImage *> *)images{
    
    [self.presenter stitchedImagePrepared:[self.stitcher stitchImages:images resultTargetSize:CGSizeMake(kSCREEN_WIDTH, kSCREEN_HEIGHT)]];
}

- (MTImageStitcher *)stitcher {
    if(!_stitcher){
        MTImageStitcher *stitcher = [[MTImageStitcher alloc] init];
        _stitcher = stitcher;
    }
    return _stitcher;
}



@end
