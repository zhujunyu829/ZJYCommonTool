//
//  UIView+capture.m
//  ZJYDemo
//
//  Created by ZhuJunyu on 2017/7/25.
//  Copyright © 2017年 zhujunyu. All rights reserved.
//

#import "UIView+capture.h"
#import "UIView+KGViewExtend.h"
#import "AppMacro.h"
@implementation UIView (capture)

- (UIImage*)getCapture
{
    
    UIImage* viewImage = nil;
    float height = 0;
    if ([self isKindOfClass:[UITableView class]]) {
        //对table 特殊处理 如果 小于一屏幕则 截成一屏幕。
        UITableView *scrollView = (UITableView *)self;
        CGSize beginSize = scrollView.contentSize;
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        height = scrollView.contentSize.height>ZJYDeviceHeight?scrollView.contentSize.height:ZJYDeviceHeight;
        CGSize captureSize = CGSizeMake(scrollView.contentSize.width, height);
        scrollView.frame = CGRectMake(0, 0, captureSize.width, captureSize.height);
        UIGraphicsBeginImageContextWithOptions(captureSize, YES, [[UIScreen mainScreen] scale]);
        [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        scrollView.contentSize = beginSize;
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
    }else{
//        float beginHeight =  self.height;
//        height = self.height>ZJYDeviceHeight?self.height:ZJYDeviceHeight;
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.frame.size.width,self.height), YES, [[UIScreen mainScreen] scale]);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        viewImage = UIGraphicsGetImageFromCurrentImageContext();
//        self.height = beginHeight;
    }
    return viewImage;
}
@end
