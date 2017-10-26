//
//  JLImageCompressVC.h
//  JLImageCompression
//
//  Created by Rong Mac mini on 2017/9/10.
//  Copyright © 2017年 Ronginet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Compression.h"

@interface JLImageCompressVC : UIViewController

/** 图片名称 */
@property(nonatomic,copy) NSString *imageName;
/** 图片类型 */
@property(nonatomic,assign) JLImageFormat imageFormat;
/** 期望压缩后的大小,单位:MB */
@property(nonatomic,assign) CGFloat specifySize;

@end
