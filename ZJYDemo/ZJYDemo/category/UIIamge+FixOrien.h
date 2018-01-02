//
//  UIIamge+FixOrien.h
//  ZJYDemo
//
//  Created by zjy on 16/3/2.
//  Copyright © 2016年 zhujunyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIImage (fixOrien)

//矫正拍照角度
- (UIImage *)fixOrientation:(UIImage *)aImage ;


/**
 保存图片到相册

 */
- (void)saveImageFrom:(UIViewController *)ctr;
@end
