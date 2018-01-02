//
//  UIButton+CRMBar_iOS11.m
//  ZJYDemo
//
//  Created by ZhuJunyu on 2017/11/6.
//  Copyright © 2017年 zhujunyu. All rights reserved.
//

#import "UIButton+CRMBar_iOS11.h"
static float rightWidth = 30;
static float leftWidth = 40;

@implementation UIButton (CRMBar_iOS11)
- (void)layoutForIOS11Left{
    if (@available(iOS 11.0, *)){
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        CGRect frame = self.frame;
        frame.size.width =frame.size.width>leftWidth?:leftWidth;
        frame.size.height = frame.size.height>44?:44;
        self.frame = frame;
    }else{
        return;
    }
}
- (void)layoutForIOS11Right{
    if (@available(iOS 11.0, *)){
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        CGRect frame = self.frame;
        frame.size.width =frame.size.width>rightWidth?:rightWidth;
        frame.size.height = frame.size.height>44?:44;
        self.frame = frame;
    }else{
        return;
    }
}
@end
