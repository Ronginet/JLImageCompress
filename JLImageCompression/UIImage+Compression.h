//
//  UIImage+Compression.h
//  JLImageCompression
//
//  Created by Rong Mac mini on 2017/9/9.
//  Copyright © 2017年 Ronginet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSData+ImageFormat.h"

@interface UIImage (Compression)

/**
 压缩图片,压缩 JPEG,PNG, 不含 GIF

 @param image 压缩前的图片
 @param imageType 指明图片类型
 @param size 期望压缩后的大小,单位:MB
 @return 压缩后的图片
 */
+ (UIImage *)jl_compressWithImage:(UIImage *)image imageType:(JLImageFormat)imageType specifySize:(CGFloat)size;

/**
 压缩图片,压缩 JPEG,PNG,GIF

 @param imageData 压缩前图片的data
 @param size 期望压缩后的大小,单位:MB
 @return 压缩后的图片
 */
+ (UIImage *)jl_compressWithImage:(NSData *)imageData specifySize:(CGFloat)size;

@end
