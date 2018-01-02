//
//  NSDictionary+CheakValue.m
//  ZJYDemo
//
//  Created by ZhuJunyu on 14-7-4.
//  Copyright (c) 2014年 zhujunyu. All rights reserved.
//

#import "NSDictionary+CheakValue.h"

@implementation NSDictionary (CheakValue)

+ (id)dictionaryWithInfoSetId:(NSString *)infoSetId pageNo:(int)pageNo{
    
    return [self dictionaryWithInfoSetId:infoSetId pageNo:pageNo pageSize:10];
}

+ (id)dictionaryWithSortName:(NSString *)sortName isDesc:(BOOL)desc{
    return [self dictionaryWithDictionary:@{@"sortName":sortName?:@"",
                                            @"sortStatus":desc?@"desc":@"asc"
                                            }];
}

+ (id)dictionaryWithInfoSetId:(NSString *)infoSetId pageNo:(int)pageNo pageSize:(int)pageSize{
    
    return [self dictionaryWithDictionary:@{@"pageBean":@{@"pageNo":@(pageNo),
                                                          @"pageSize":@(pageSize)
                                                          },
                                            @"infoSetId":infoSetId?:@""}];
}

- (NSString *)ObjectForKeyCheackNull:(id)key{
    if ([[[self objectForKey:key] class] isSubclassOfClass:[NSString class]]&&[[self objectForKey:key] length]) {
        return [self objectForKey:key];
    }
    return @"";
}

- (NSString *)ObjectForKeyCheackNulldic:(id)key{
    if ([[[self objectForKey:key] class] isSubclassOfClass:[NSString class]]&&[[self objectForKey:key] length]) {
        return [self objectForKey:key];
    }
    return @"0";
}

- (NSString *)ObjectForKeyNull:(id)key{
    if (![key isEqual:[NSNull null]]&&[[self objectForKey:key] length]) {
        
        return [self objectForKey:key];
    }
    return @"0";
}
+ (NSDictionary *)dictionaryFromeJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\t" withString:@"\\t"];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
- (NSString *)convertToJSONString{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = @"";
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    }else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
