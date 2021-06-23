//
//  MTImageCellNode.m
//  Memou
//
//  Created by Tom.Liu on 2021/6/20.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTImageCellNode.h"

@interface MTImageCellNode ()
@property (strong, nonatomic) ASImageNode *imageNode;
@end



@implementation MTImageCellNode
-(instancetype)initWithModel:(MTImageCellModel *)model {
    if (self = [super init]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _imageNode = [[ASImageNode alloc] init];
        _imageNode.image = model.image;
        
        [self addSubnode:_imageNode];
        
    }
    return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    
    ASRatioLayoutSpec *postImageRatioSpec = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:9.0/16.0 child:_imageNode];
//
//    ASInsetLayoutSpec *titleInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 8, 8, 8) child:_titleTextNode];
//
//    ASRelativeLayoutSpec *titleRelativeSpec = [ASRelativeLayoutSpec relativePositionLayoutSpecWithHorizontalPosition:ASRelativeLayoutSpecPositionStart verticalPosition:ASRelativeLayoutSpecPositionEnd sizingOption:ASRelativeLayoutSpecSizingOptionDefault child:titleInsetSpec];
//    ASOverlayLayoutSpec *titleOverlaySpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:postImageRatioSpec overlay:titleRelativeSpec];
//
//    _userImageNode.style.preferredSize = CGSizeMake(25, 25);
////
//    ASStackLayoutSpec *videoStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
//                                                                                spacing:8
//                                                                         justifyContent:ASStackLayoutJustifyContentStart
//                                                                             alignItems:ASStackLayoutAlignItemsStretch
//                                                                               children:@[_imageNode]];
//
    ASInsetLayoutSpec *videoInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(16, 16, 0, 16) child:postImageRatioSpec];
//
    return videoInsetSpec;
}


@end
