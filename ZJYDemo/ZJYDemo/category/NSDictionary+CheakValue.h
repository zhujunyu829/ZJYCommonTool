//
//  NSDictionary+CheakValue.h
//  ZJYDemo
//
//  Created by ZhuJunyu on 14-7-4.
//  Copyright (c) 2014年 zhujunyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CheakValue)


/**
 初始化基础参数的字典
 默认每页10条
 @param infoSetId 接口id
 @param pageNo 页数
 @return 返回初始化基础参数的字典
 */
+ (id)dictionaryWithInfoSetId:(NSString *)infoSetId pageNo:(int)pageNo;


/**
 返回排序参数

 @param sortName 排序字段
 @param desc 是否为降序排列  YES 降序 NO 升序
 @return 返回排序参数 {sortName: "budget_date", sortStatus: "asc"}
 */
+ (id)dictionaryWithSortName:(NSString *)sortName isDesc:(BOOL)desc;
/**
 初始化基础参数的字典

 @param infoSetId 接口id
 @param pageNo 页数
 @param pageSize 每页的的条数
 @return 初始化基础参数的字典
 */
+ (id)dictionaryWithInfoSetId:(NSString *)infoSetId pageNo:(int)pageNo pageSize:(int)pageSize;
/**
 *  获取字典中的字符对象 并判断是否有值 没有值的返空格
 *
 *  @param key 关键字
 *
 *  @return 返回取出的对象
 */
- (NSString *)ObjectForKeyNull:(id)key;
- (NSString *)ObjectForKeyCheackNull:(id)key;
- (NSString *)ObjectForKeyCheackNulldic:(id)key;

/**
 将字典转化成json字符串

 @return json字符串
 */
- (NSString *)convertToJSONString;

/**
 将json字符串转换成字典

 @param jsonString json字符串
 @return 字典
 */
+ (NSDictionary *)dictionaryFromeJsonString:(NSString *)jsonString;
@end
