//
//  HNStringUitils.m
//  dongdong
//
//  Created by xydtech on 16/7/8.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import "HNStringUitils.h"

@implementation HNStringUitils

+ (BOOL)stringIsNull:(NSString *)string
{
    if (![string isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if (!string || [string isKindOfClass:[NSNull class]] || string.length == 0 || [string isEqualToString:@""]) {
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)stringIsAllWhiteSpace:(NSString *)string
{
    if ([HNStringUitils stringIsNull:string]) {
        return YES;
    }else{
        
        NSString *trimString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (trimString.length > 0) {
            return NO;
        }else{
            return YES;
        }
    }
}

+ (BOOL)stringToBool:(NSString*)sourceString
{
    if ([HNStringUitils stringIsNull:sourceString]) {
        return NO;
    }else{
        return [sourceString boolValue];
    }
}

+ (NSInteger)stringToInt:(NSString*)sourceString
{
    if ([HNStringUitils stringIsNull:sourceString]) {
        return NSIntegerMax;
    }else{
        return [sourceString intValue];
    }
}

+ (CGFloat)stringToFloat:(NSString*)sourceString
{
    if ([HNStringUitils stringIsNull:sourceString]) {
        return CGFLOAT_MAX;
    }else{
        return [sourceString floatValue];
    }
}

+ (double)stringToDouble:(NSString*)sourceString
{
    if ([HNStringUitils stringIsNull:sourceString]) {
        return CGFLOAT_MAX;
    }else{
        return [sourceString doubleValue];
    }
}

+ (NSString *)boolToString:(BOOL)boolValue
{
    return [NSString stringWithFormat:@"%d",boolValue];
}

+ (NSString *)intToString:(NSInteger)intValue
{
    return [NSString stringWithFormat:@"%ld",(long)intValue];
}

+ (NSString *)floatToString:(CGFloat)floatValue
{
    return [NSString stringWithFormat:@"%f",floatValue];
}

+ (NSString *)doubleToString:(double)doubleValue
{
    return [NSString stringWithFormat:@"%lf",doubleValue];
}

+ (NSString*)stringFromFile:(NSString*)path
{
    if ([HNStringUitils stringIsNull:path]) {
        return nil;
    }
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
}


+ (NSString*)currentTimeStampString
{
    NSDate *now = [NSDate date];
    NSTimeInterval timeInterval = [now timeIntervalSinceReferenceDate];
    
    NSString *timeString = [NSString stringWithFormat:@"%lf",timeInterval];
    timeString = [timeString stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    return timeString;
    
}

+ (NSString *)stringByTrimingLeadingWhiteSpace:(NSString *)string
{
    NSRange range = [string rangeOfString:@"^\\s*" options:NSRegularExpressionSearch];
    return [string stringByReplacingCharactersInRange:range withString:@""];
}

+ (NSString *)stringByTrimingTailingWhiteSpace:(NSString *)string
{
    NSRange range = [string rangeOfString:@"\\s*$" options:NSRegularExpressionSearch];
    return [string stringByReplacingCharactersInRange:range withString:@""];
}

+ (NSString *)stringByTrimingWhiteSpace:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}


+ (NSRange)stringRange:(NSString *)string
{
    if ([HNStringUitils stringIsNull:string]) {
        return NSMakeRange(NSNotFound, 0);
    }
    return NSMakeRange(0, string.length);
}


@end
