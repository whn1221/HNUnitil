//
//  HNDateUitilDefine.h
//  dongdong
//
//  Created by xydtech on 16/7/27.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#ifndef HNDateUitilDefine_h
#define HNDateUitilDefine_h

#import "HNDateUitil.h"

/**
 *  获取当前日历
 */
#define HNDateCurrentCalendar [HNDateUitil sharedCalendar]

/**
 *  获取单例格式化器
 */
#define HNDateShareFormatter [HNDateUitil sharedDateFormatter]

/**
 *  相对现在日期得间隔天数
 */
#define HNDateDaysAgo(aDate) [HNDateUitil daysAgoFromNow:aDate]

/**
 *  不以午夜为基准计算天数之前
 */
#define HNDateDaysAgoAgainstMidNight(aDate) [HNDateUitil daysAgoAgainstMidnight:aDate]

/**
 *  获取一个时间与当前时间间隔详情字符串
 */
#define HNDateTimeAgoString(aDate) [HNDateUitil detailTimeAgoString:aDate]

/**
 *  获取一个时间戳与当前时间的间隔详情字符串
 */
#define HNDateTimeAgoStringByTimeInterval(timeInterval) [HNDateUitil detailTimeAgoStringByInterval:timeInterval]

/**
 *  天数间隔文本字符串
 */
#define HNDateStringDaysAgo(aDate) [HNDateUitil stringDaysAgo:aDate]

/**
 *  这个日期是星期几
 */
#define HNDateGetWeekDay(aDate) [HNDateUitil weekDay:aDate]

/**
 *  返回这个日期是星期几字符串
 */
#define  HNDateGetWeekDayString(aDate) [HNDateUitil weekDayString:aDate]

/**
 *  返回这个日期在全年中是第多少周字符串
 */
#define  HNDateGetWeekNumString(aDate) [HNDateUitil weekNumberString:aDate]

/**
 *  在全年中是第多少周
 */
#define HNDateGetWeekNum(aDate) [HNDateUitil weekNumber:aDate]

/**
 *  获取日期中得年份
 */
#define HNDateGetYear(aDate) [HNDateUitil year:aDate]

/**
 *  获取日期中得月份
 */
#define HNDateGetMonth(aDate) [HNDateUitil month:aDate]

/**
 *  获取日期中的日
 */
#define HNDateGetDay(aDate) [HNDateUitil day:aDate]

/**
 *  获取日期中得小时
 */
#define HNDateGetHour(aDate) [HNDateUitil hour:aDate]

/**
 *  获取日期中的分钟
 */
#define HNDateGetMinute(aDate) [HNDateUitil minute:aDate]

/**
 *  日期转字符串
 */
#define HNDateToString(aDate) [HNDateUitil stringFromDate:aDate]

/**
 *  字符串转日期
 */
#define HNDateFromString(aString) [HNDateUitil dateFromString:aString]

/**
 *  字符串转日期详细时间
 */
#define HNDateTimeFromString(aString) [HNDateUitil dateTimeFromString:aString]

/**
 *  将时间戳转成日期
 */
#define HNDateFromTimeInterval(timeInterval) [HNDateUitil dateFromTimeInterval:timeInterval]

/**
 *  按照某个格式将日期转成字符串
 */
#define HNDateToStringByFormat(aDate,format) [HNDateUitil stringFromDate:aDate withFormat:format]

/**
 *  按照某个格式将字符串转成日期
 */
#define HNDateFromStringByFormat(aString,format) [HNDateUitil dateFromString:aString withFormat:format]

/**
 *  这个日期所在周的起始日期
 */
#define HNDateBeginningOfWeek(aDate) [HNDateUitil beginningOfWeek:aDate]

/**
 *  这个日期的起始时间
 */
#define HNDateBeginningOfDay(aDate) [HNDateUitil beginningOfDay:aDate]

/**
 *  这个日期所在周的结束日期
 */
#define HNDateEndOfWeek(aDate) [HNDateUitil endOfWeek:aDate]

/**
 *  普通日期格式字符串
 */
#define HNDateFormatString [HNDateUitil dateFormatString]

/**
 *  普通时间格式字符串
 */
#define HNDateTimeFormatString [HNDateUitil timeFormatString]

/**
 *  时间戳格式字符串
 */
#define HNDateTimeStampFormatString [HNDateUitil timestampFormatString]

/**
 *  数据库存储格式字符串
 */
#define HNDateDataBaseFormatString [HNDateUitil dbFormatString]

/**
 *  生日转年龄
 */
#define HNDateBirthDayToAge(date) [HNDateUitil birthdayToAge:date]

/**
 *  生日转年龄
 */
#define HNDateBirthDayToAgeByTimeInterval(timeInterval) [HNDateUitil birthdayToAgeByTimeInterval:timeInterval]

/**
 *  日期转星座
 */
#define HNDateToConstellation(date) [HNDateUitil dateToConstellation:date]

/**
 *  时间戳转星座
 */
#define HNDateToConstellationByTimeInterval(timeInterval) [HNDateUitil dateToConstellationByTimeInterval:timeInterval]


#endif /* HNDateUitilDefine_h */
