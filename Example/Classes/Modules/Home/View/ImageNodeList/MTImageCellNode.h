//
//  MTImageCellNode.h
//  Memou
//
//  Created by Tom.Liu on 2021/6/20.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "MTImageCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MTImageCellNode : ASCellNode
-(instancetype)initWithModel:(MTImageCellModel *)video;
@end

NS_ASSUME_NONNULL_END
