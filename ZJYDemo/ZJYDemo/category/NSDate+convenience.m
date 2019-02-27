//
//  NSDate+convenience.m
//
//  Created by in 't Veen Tjeerd on 4/23/12.
//  Copyright (c) 2012 Vurig Media. All rights reserved.
//

#import "NSDate+convenience.h"

@implementation NSDate (Convenience)
- (BOOL)isTheZhuJunyueDayWithDate:(NSDate *)date{
    if (self.day == date.day && self.month== date.month &&self.year == date.year ) {
        return YES;
    }
    return NO;
}

-(int)year {
    
    NSCalendar *gregorian = [[[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents *components = [gregorian components:NSYearCalendarUnit fromDate:self];
    return [components year];
}


-(int)month {
    NSCalendar *gregorian = [[[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian] autorelease];
    NSDateComponents *components = [gregorian components:NSCalendarUnitMonth fromDate:self];
    return [components month];
}

-(int)day {
    NSCalendar *gregorian = [[[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian] autorelease];
    NSDateComponents *components = [gregorian components:NSCalendarUnitDay fromDate:self];
    return [components day];
}
-(int)week{
    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents*comps;
    comps =[calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit)
                       fromDate:self];
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    return weekday;
}
-(int)firstWeekDayInMonth {
    NSCalendar *gregorian = [[[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    [gregorian setFirstWeekday:2]; //monday is first day
    //[gregorian setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"nl_NL"]];
    
    //Set date to first of month
    NSDateComponents *comps = [gregorian components:NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit fromDate:self];
    [comps setDay:1];
    NSDate *newDate = [gregorian dateFromComponents:comps];

    if ([gregorian ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:newDate] == 7) {
        return 0;
    }
    return [gregorian ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:newDate];
}

-(NSDate *)offsetMonth:(int)numMonths {
    NSCalendar *gregorian = [[[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[[NSDateComponents alloc] init] autorelease];
    [offsetComponents setMonth:numMonths];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                                   toDate:self options:0];
}

-(NSDate *)offsetHours:(int)hours {
    NSCalendar *gregorian = [[[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[[NSDateComponents alloc] init] autorelease];
    //[offsetComponents setMonth:numMonths];
    [offsetComponents setHour:hours];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}

-(NSDate *)offsetDay:(int)numDays {
    NSCalendar *gregorian = [[[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[[NSDateComponents alloc] init] autorelease];
    [offsetComponents setDay:numDays];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}



-(int)numDaysInMonth {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    NSUInteger numberOfDaysInMonth = rng.length;
    return numberOfDaysInMonth;
}

+(NSDate *)dateStartOfDay:(NSDate *)date {
    NSCalendar *gregorian = [[[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *components =
    [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                           NSDayCalendarUnit) fromDate: date];
    return [gregorian dateFromComponents:components];
}

+(NSDate *)dateStartOfWeek {
    NSCalendar *gregorian = [[[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];

    NSDateComponents *componentsToSubtract = [[[NSDateComponents alloc] init] autorelease];
    [componentsToSubtract setDay: - ((([components weekday] - [gregorian firstWeekday])
                                      + 7 ) % 7)];
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:[NSDate date] options:0];
    
    NSDateComponents *componentsStripped = [gregorian components: (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                                                fromDate: beginningOfWeek];
    
    //gestript
    beginningOfWeek = [gregorian dateFromComponents: componentsStripped];
    
    return beginningOfWeek;
}

+(NSDate *)dateEndOfWeek {
    NSCalendar *gregorian =[[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    
    
    NSDateComponents *componentsToAdd = [[[NSDateComponents alloc] init] autorelease];
    [componentsToAdd setDay: + (((([components weekday] - [gregorian firstWeekday])
                                      + 7 ) % 7))+6];
    NSDate *endOfWeek = [gregorian dateByAddingComponents:componentsToAdd toDate:[NSDate date] options:0];
    
    NSDateComponents *componentsStripped = [gregorian components: (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                                                       fromDate: endOfWeek];
    
    //gestript
    endOfWeek = [gregorian dateFromComponents: componentsStripped];
    return endOfWeek;
}
- (NSString *)changeYYYMMDDHHmmss{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [f stringFromDate:self];
}
- (NSString *)changeYYYMMDDHHmm{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [f stringFromDate:self];
}

- (NSString *)changeYYYMMDD{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setDateFormat:@"yyyy-MM-dd"];
    return [f stringFromDate:self];
}
- (NSString *)changeYYYMMDDString{
    NSDateFormatter *f = [NSDateFormatter new];
    [f setDateFormat:@"yyyy年MM月dd日"];
    return [f stringFromDate:self];
}

- (NSString *)timeShowSting{
    if (!self) {
        return @"";
    }
    NSDateFormatter *f = [NSDateFormatter new];
    [f setDateFormat:@"YYYY"];
    NSString *timeYear = [f stringFromDate:self];  //服务器返回的日期-年
    
    NSDate *nowDate = [NSDate date];
    [f setDateFormat:@"YYYY"];
    NSString *currentYear = [f  stringFromDate:nowDate];   //当前日期时间-年
    
    [f setDateFormat:@"YYYY-MM-dd 00:00:00"];
    NSString *todayStr = [f  stringFromDate:nowDate];
    NSDate *todayDate = [f dateFromString:todayStr];   //当前日期的零点
    NSInteger secondWithZero = [todayDate timeIntervalSinceDate:self];  //和今天0点对比 <0今天
    if(secondWithZero <= 0 && secondWithZero >- 60 * 60 * 24){
        [f setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"今天%@",[f stringFromDate:self]];
    }else if (secondWithZero > 0 && secondWithZero <= 60 * 60 * 24) {
        [f setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"昨天%@",[f stringFromDate:self]];
    }else if ([timeYear integerValue] == [currentYear integerValue]) {
        [f setDateFormat:@"MM/dd HH:mm"];
        return [f stringFromDate:self];
    }else{
        [f setDateFormat:@"YYYY/MM/dd"];
        return [f stringFromDate:self];
    }
    return @"";
}

- (NSString *)dynamicShowSting{//动态 时间显示
    if (!self) {
        return @"";
    }
    NSDateFormatter *f = [NSDateFormatter new];
    [f setDateFormat:@"YYYY"];
    NSString *timeYear = [f stringFromDate:self];  //服务器返回的日期-年
    
    NSDate *nowDate = [NSDate date];
    [f setDateFormat:@"YYYY"];
    NSString *currentYear = [f  stringFromDate:nowDate];   //当前日期时间-年
    
    [f setDateFormat:@"YYYY-MM-dd 00:00:00"];
    NSString *todayStr = [f  stringFromDate:nowDate];
    NSDate *todayDate = [f dateFromString:todayStr];   //当前日期的零点
    NSInteger secondWithZero = [todayDate timeIntervalSinceDate:self];  //和今天0点对比 <0今天
    if(secondWithZero <= 0 && secondWithZero >- 60 * 60 * 24){
        [f setDateFormat:@"HH:mm"];
        if (secondWithZero>=-60*60*12) {
            return [NSString stringWithFormat:@"%@ 上午",[f stringFromDate:self]];
        }else{
             return [NSString stringWithFormat:@"%@ 下午",[f stringFromDate:self]];
        }
    }else if (secondWithZero > 0 && secondWithZero <= 60 * 60 * 24) {
        [f setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"%@ 昨天",[f stringFromDate:self]];
    }else if ([timeYear integerValue] == [currentYear integerValue]) {
        [f setDateFormat:@"MM/dd HH:mm"];
        return [f stringFromDate:self];
    }else{
        [f setDateFormat:@"YYYY/MM/dd HH:mm"];
        return [f stringFromDate:self];
    }
    return @"";
}
@end
