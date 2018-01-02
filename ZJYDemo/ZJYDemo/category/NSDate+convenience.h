//
//  NSDate+convenience.h
//
//  Created by in 't Veen Tjeerd on 4/23/12.
//  Copyright (c) 2012 Vurig Media. All rights reserved.
//
//时间处理类
#import <Foundation/Foundation.h>

@interface NSDate (Convenience)

-(NSDate *)offsetMonth:(int)numMonths;
-(NSDate *)offsetDay:(int)numDays;
-(NSDate *)offsetHours:(int)hours;

//返回时间对应的数字
-(int)numDaysInMonth;
-(int)firstWeekDayInMonth;
-(int)year;
-(int)month;
-(int)day;
-(int)week;
/**
 判断是否是同一天
 @param date 需要判断的时间
 @return YES是同一天 NO 不是同一天
 */
- (BOOL)isTheZhuJunyueDayWithDate:(NSDate *)date;

/**
 将时间转换成yyyy-MM-dd HH:mm:ss格式
 @return  2017-10-10 19:30:59
 */
- (NSString *)changeYYYMMDDHHmmss;

/**
 将时间转换成yyyy-MM-dd HH:mm 格式
 @return  2017-10-10 19:30
 */
- (NSString *)changeYYYMMDDHHmm;

/**
 将时间转换成yyyy-MM-dd格式
  @return  2017-10-10
 */
- (NSString *)changeYYYMMDD;

/**
 将时间转换成yyyy年MM月dd日 格式
@return  2017年10月10日
 */
- (NSString *)changeYYYMMDDString;



+(NSDate *)dateStartOfDay:(NSDate *)date;

+(NSDate *)dateStartOfWeek;

/**
 取每周第一天
 @return 所在周的第一天
 */
+(NSDate *)dateEndOfWeek;

/**
 返回时间格式
 昨天 ； 今天 ； 10/17 10:20 ；2017／09/09
 @return 返回格式化好的 时间
 */
- (NSString *)timeShowSting;

 
/**
 动态列表时间显示
昨天 ； 上午 下午 ； 10/17 10:20 ；2017／09/09
 @return 回格式化好的 时间
 */
- (NSString *)dynamicShowSting;//动态 时间显示
@end
