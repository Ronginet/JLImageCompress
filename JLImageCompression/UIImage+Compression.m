//
//  UIImage+Compression.m
//  JLImageCompression
//
//  Created by Rong Mac mini on 2017/9/9.
//  Copyright © 2017年 Ronginet. All rights reserved.
//

#import "UIImage+Compression.h"

@implementation UIImage (Compression)

+ (UIImage *)jl_compressWithImage:(UIImage *)image imageType:(JLImageFormat)imageType specifySize:(CGFloat)size {
    if (imageType == JLImageFormatPNG) {
        NSData *data = UIImagePNGRepresentation(image);
        return [self jl_compressWithImage:data specifySize:size];
    }
    
    if (imageType == JLImageFormatJPEG) {
        NSData *data = UIImageJPEGRepresentation(image, 1.0);
        return [self jl_compressWithImage:data specifySize:size];
    }
    
    return image;
}

+ (UIImage *)jl_compressWithImage:(NSData *)imageData specifySize:(CGFloat)size {
    CGFloat specifySize = size * 1024 * 1024;
    
    JLImageFormat imageFormat = [NSData jl_imageFormatWithImageData:imageData];
    if (imageFormat == JLImageFormatPNG) {
        UIImage *image = [UIImage imageWithData:imageData];
        while (imageData.length > specifySize) {
            CGFloat targetWidth = image.size.width * 0.9;
            CGFloat targetHeight = image.size.height * 0.9;
            CGRect maxRect = CGRectMake(0, 0, targetWidth, targetHeight);
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(floorf(targetWidth), floorf(targetHeight)), NO, [UIScreen mainScreen].scale);
            [image drawInRect:maxRect];
            image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            imageData = UIImagePNGRepresentation(image);
        }
        return image;
    }
    
    if (imageFormat == JLImageFormatJPEG) {
        UIImage *image = [UIImage imageWithData:imageData];
        while (imageData.length > specifySize) {
            imageData = UIImageJPEGRepresentation(image, 0.9);
            image = [UIImage imageWithData:imageData scale:[UIScreen mainScreen].scale];
        }
        return image;
    }
    
    return [UIImage imageWithData:imageData];
}

@end
