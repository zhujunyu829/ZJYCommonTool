//
//  UIColor+RGB.h
//  ZJYDemo
//
//  Created by ZhuJunyu on 14-11-20.
//  Copyright (c) 2014年 zhujunyu. All rights reserved.
//

#import <UIKit/UIKit.h>
//16进制颜色转换

@interface UIColor (RGB)
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert withAlpha:(CGFloat)alpha;
@end
