//
//  HNColorUitil.h
//  dongdong
//
//  Created by xydtech on 16/7/27.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HNColorUitil : NSObject

+ (UIColor *)colorFromRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

+ (UIColor *)colorFromRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue withAlpha:(CGFloat)alpha;

+ (UIColor *)colorFromHexString:(NSString *)hexString;


@end
