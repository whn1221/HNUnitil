//
//  HNStringUitils.h
//  dongdong
//
//  Created by xydtech on 16/7/8.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HNStringUitils : NSObject

/**  */
+ (BOOL)stringIsNull:(NSString *)string;

+ (BOOL)stringIsAllWhiteSpace:(NSString *)string;

+ (BOOL)stringToBool:(NSString*)sourceString;

+ (NSInteger)stringToInt:(NSString*)sourceString;

+ (CGFloat)stringToFloat:(NSString*)sourceString;

+ (double)stringToDouble:(NSString*)sourceString;

+ (NSString *)boolToString:(BOOL)boolValue;

+ (NSString *)intToString:(NSInteger)intValue;

+ (NSString *)floatToString:(CGFloat)floatValue;

+ (NSString *)doubleToString:(double)doubleValue;

+ (NSString*)stringFromFile:(NSString*)path;

+ (NSString*)currentTimeStampString;

+ (NSString *)stringByTrimingLeadingWhiteSpace:(NSString *)string;

+ (NSString *)stringByTrimingTailingWhiteSpace:(NSString *)string;

+ (NSString *)stringByTrimingWhiteSpace:(NSString *)string;

+ (NSRange)stringRange:(NSString *)string;


@end
