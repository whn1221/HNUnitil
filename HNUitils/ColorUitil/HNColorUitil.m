//
//  HNColorUitil.m
//  dongdong
//
//  Created by xydtech on 16/7/27.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import "HNColorUitil.h"
#import "HNStringUitil.h"

@implementation HNColorUitil

+ (UIColor *)colorFromRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [HNColorUitil colorFromRed:red green:green blue:blue withAlpha:1.0];
}

+ (UIColor *)colorFromRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue withAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    if (HNStringIsNull(hexString) || hexString.length != 6) {
        return nil;
    }
    
    unsigned hexNum;
    if ( ![[NSScanner scannerWithString:hexString] scanHexInt:&hexNum] ) {
        return nil;
    }
    
    return [UIColor colorWithRed:((float)((hexNum & 0xFF0000) >> 16))/255.0 green:((float)((hexNum & 0xFF00) >> 8))/255.0 blue:((float)(hexNum & 0xFF))/255.0 alpha:1.0];
}

@end
