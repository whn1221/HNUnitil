//
//  HNStringUitil.h
//  dongdong
//
//  Created by xydtech on 16/7/8.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#ifndef HNStringUitil_h
#define HNStringUitil_h

#import "HNStringUitils.h"

/**
 *  字符串是否为空
 */
#define HNStringIsNull(string) [HNStringUitils stringIsNull:string]

/**
 *  字符串是否全为空格
 */
#define HNStringIsAllWhiteSpace(string) [HNStringUitils stringIsAllWhiteSpace:string]

/**
 *  字符串转NSInteger
 */
#define HNStringToInt(string) [HNStringUitils stringToInt:string]

/**
 *  字符串转CGFloat
 */
#define HNStringToFloat(string) [HNStringUitils stringToFloat:string]

/**
 *  字符串转double
 */
#define HNStringToDouble(string) [HNStringUitils stringToDouble:string]

/**
 *  字符串转Bool
 */
#define HNStringToBool(string) [HNStringUitils stringToBool:string]

/**
 *  int转字符串
 */
#define HNStringFromInt(int) [HNStringUitils intToString:int]

/**
 *  float转字符串
 */
#define HNStringFromFloat(float) [HNStringUitils floatToString:float]

/**
 *  double转字符串
 */
#define HNStringFromDouble(double) [HNStringUitils doubleToString:double]

/**
 *  bool转字符串
 */
#define HNStringFromBool(bool) [HNStringUitils boolToString:bool]

/**
 *  从文件中读取出字符串
 */
#define HNStringFromFile(path) [HNStringUitils stringFromFile:path]

/**
 *  获取一个当前时间戳字符串
 */
#define HNStringCurrentTimeStamp [HNStringUitils currentTimeStampString]

/**
 *  返回去除字符串首的空格的字符串
 */
#define HNStringClearLeadingWhiteSpace(string) [HNStringUitils stringByTrimingLeadingWhiteSpace:string]

/**
 *  返回去除字符串结尾的空格的字符串
 */
#define HNStringClearTailingWhiteSpace(string) [HNStringUitils stringByTrimingTailingWhiteSpace:string]

/**
 *  返回去除字符串中所有的空格的字符串
 */
#define HNStringClearAllWhiteSpace(string) [HNStringUitils stringByTrimingWhiteSpace:string]

/**
 *  返回字符串范围
 */
#define HNStringRange(string) [HNStringUitils stringRange:string]

#endif /* HNStringUitil_h */
