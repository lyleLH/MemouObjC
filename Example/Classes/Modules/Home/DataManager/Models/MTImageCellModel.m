//
//  MTImageCellModel.m
//  Memou
//
//  Created by Tom.Liu on 2021/6/20.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTImageCellModel.h"

// Reuse the Path image formats
// NSString * const XXImageFormatNameUserThumbnailSmall = @"com.mycompany.myapp.XXImageFormatNameUserThumbnailSmall";
// NSString * const XXImageFormatNameUserThumbnailMedium = @"com.mycompany.myapp.XXImageFormatNameUserThumbnailMedium";
// NSString * const XXImageFormatFamilyUserThumbnails = @"com.mycompany.myapp.XXImageFormatFamilyUserThumbnails";




@implementation MTImageCellModel

//{
//NSString *_UUID;
//}
//
//- (NSString *)UUID
//{
//if (_UUID == nil) {
//    CFUUIDBytes UUIDBytes = FICUUIDBytesFromMD5HashOfString(self.filename);
//    _UUID = FICStringWithUUIDBytes(UUIDBytes);
//}
//return _UUID;
//
//}
//
//- (NSString *)sourceImageUUID
//{
//return self.UUID;
//}
//
//- (NSURL *)sourceImageURLWithFormatName:(NSString *)formatName
//{
//return [[NSBundle mainBundle] URLForResource:self.filename withExtension:@"jpg"];
//}
//
//- (FICEntityImageDrawingBlock)drawingBlockForImage:(UIImage *)image withFormatName:(NSString *)formatName
//{
//FICEntityImageDrawingBlock drawingBlock = ^(CGContextRef context, CGSize contextSize) {
//    CGRect contextBounds = CGRectZero;
//    contextBounds.size = contextSize;
//    CGContextClearRect(context, contextBounds);
//
//    UIGraphicsPushContext(context);
//    [image drawInRect:contextBounds];
//    UIGraphicsPopContext();
//};
//
//return drawingBlock;
//}


@end
