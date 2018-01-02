//
//  AppMacro.h
//  ZJYDemo
//
//  Created by ZhuJunyu on 2017/10/25.
//  Copyright © 2017年 zhujunyu. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h
#import "UIColor+RGB.h"

/**
 空白代码块
 */
typedef void(^voidBlock) (void);

/**
 *系统版本
 */
#define ZJYsystemVersion      ([[[UIDevice currentDevice] systemVersion] floatValue])

//当前设备的屏幕宽度
#define ZJYDeviceWidth [UIScreen mainScreen].bounds.size.width
//当前设备的屏幕高度
#define ZJYDeviceHeight [UIScreen mainScreen].bounds.size.height
/**
 *颜色值 十六进制转换成uicolor
 */
#define ZJYColorHex(hexValue) [UIColor colorWithHexString:(hexValue)]
/**
 *颜色值 RGB转uicolor
 */
#define ZJYRGB(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

#define  FixedSpaceWidht  (ZJYsystemVersion>=11.0?0:20)
/**
 *系统字体
 */
#define ZJYSYFont(size) ZJYsystemVersion<9.0?ZJYSYWidthFitFont(size):ZJYSYWidthFitFont(size-1)
#define ZJYSYWidthFitFont(size) [UIFont systemFontOfSize:ZJYDeviceWidth>320?size:(size-1)]

#define ZJYBodyFont(size) ZJYsystemVersion<9.0?ZJYBodyFontWidthFitFont(size):ZJYBodyFontWidthFitFont(size-1)
#define ZJYBodyFontWidthFitFont(size) [UIFont boldSystemFontOfSize:ZJYDeviceWidth>320?size:(size-2)]

static const int  OpenSettings_Tag = 1001110;


/**
 *输出宏自定义
 *
 */
//#ifdef DEBUG
//#define NSLog(...)  NSLog( @"<%s (%d)> \n",__FUNCTION__, __LINE__,  __VA_ARGS__ )
//
//
//#define debugMethod() NSLog(@"%s", __func__)
//#else
//#define NSLog(...)
//#define debugMethod()
//#endif



#endif /* AppMacro_h */
