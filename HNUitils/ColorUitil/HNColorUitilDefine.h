
//
//  HNColorUitilDefine.h
//  dongdong
//
//  Created by xydtech on 16/7/27.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#ifndef HNColorUitilDefine_h
#define HNColorUitilDefine_h

#import "HNColorUitil.h"

/**
 *  快速得到RGB颜色
 */
#define HNQuickRGBColor(redValue,greenValue,blueValue) [HNColorUitil colorFromRed:redValue green:greenValue blue:blueValue]

/**
 *  获取带alpha值的RGB颜色
 */
#define HNQuickRGBColorAlpha(redValue,greenValue,blueValue,alpha) [HNColorUitil colorFromRed:redValue green:greenValue blue:blueValue withAlpha:alpha]

/**
 *  从16进制字符中得到颜色
 */
#define HNQuickHexColor(hexString) [HNColorUitil colorFromHexString:hexString]


#endif /* HNColorUitilDefine_h */
