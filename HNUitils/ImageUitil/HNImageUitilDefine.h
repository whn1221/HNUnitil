
//
//  HNImageUitilDefine.h
//  dongdong
//
//  Created by xydtech on 16/7/27.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#ifndef HNImageUitilDefine_h
#define HNImageUitilDefine_h

#import "HNImageUitil.h"

/**
 *  快速获取图片
 */
#define HNQuickImage(imageName) [HNImageUitil imageWithName:imageName]

/**
 *  修正图片方向
 *
 */
#define HNFixOretationImage(aImage) [HNImageUitil fixOretationImage:aImage]

/**
 *  创建圆角图片
 */
#define HNRoundCornerImage(aImage,cornerSize,boardSize) [HNImageUitil createRoundCornerImage:aImage withCornerSize:cornerSize withBoardSize:boardSize]

/**
 *  组合图片
 */
#define HNQuickCombineImage(backgroundImage,maskImage) [HNImageUitil combineImage:backgroundImage withMaskImage:maskImage]

/**
 *  返回圆形图片,默认用白色作为遮挡颜色
 */
#define HNCycleImage(aImage) [HNImageUitil roundImage:aImage]

/**
 *  截取Rect部分的图片
 */
#define HNPartImage(aImage,rect) [HNImageUitil partImage:aImage withRect:rect]

/**
 *  返回纠正方向后得图片
 */
#define HNCorrectOrientationImage(aImage) [HNImageUitil correctImageOrientation:aImage]

/**
 *  返回一个纠正了方向并且进行了scale倍数缩放的图片
 */
#define HNCorrectOrientationImageWithScale(aImage,scale) [HNImageUitil correctImageOrientation:aImage withScaleSize:scale]

/**
 *  返回ALAsset纠正方向后并且进行了scale倍数缩放的fullResolutionImage图片
 */
#define HNCorrectOrientationALAssetFullResolutionImageWithScale(aALAsset,scale) [HNImageUitil  correctFullSolutionImageFromALAsset:aALAsset withScaleSize:scale]

/**
 *  返回ALAsset纠正方向后的fullResolutionImage图片
 */
#define HNCorrectOrientationALAssetFullResolutionImage(aALAsset) [HNImageUitil correctFullSolutionImageFromALAsset:aALAsset]

/**
 *  获取一个View的截图
 */
#define HNScreenShotFromView(aView) [HNImageUitil viewScreenShot:aView]

/**
 *  获取一个Layer的截图
 */
#define HNScreenShotFromLayer(aLayer) [HNImageUitil layerScreenShot:aLayer]

/**
 *  按照aColor颜色创建一张size大小的图片
 *
 */
#define HNQuickImageByColorWithSize(aColor,size) [HNImageUitil imageForColor:aColor withSize:size]

/**
 *  创建一个线性渐变图片
 *
 *  @param colors    按顺序渐变颜色数组
 *  @param size      需要创建的图片的大小
 *
 *  最大只支持三种颜色，起始位置颜色，中间颜色，结束颜色
 *  依次位置为 0,0.5,1.0
 *  超过3种颜色也只取前三种颜色为渐变色
 *
 *  @return 返回渐变颜色图片
 */
#define HNLinearGradientImageByColorsWithSize(colors,size) [HNImageUitil gradientLinearImageFromColors:colors withImageSize:size]

/**
 *  创建线性渐变图片
 *
 *  @param fromColor 起始发颜色
 *  @param toColor   中间颜色
 *  @param size      图片大小
 *
 *  @return 渐变图片
 */
#define HNLinearGradientImageFromColorToColor(fromColor,toColor,size) [HNImageUitil gradientLinearImageFromColor:fromColor withToColor:toColor withImageSize:size]

/**
 *  创建球形渐变图片
 *
 *  @param fromColor 中心颜色
 *  @param toColor   外层颜色
 *  @param size      图片大小
 *
 *  @return 渐变图片
 */
#define HNRadialGradientImageFromColorToColor(fromColor,toColor,size) [HNImageUitil gradientRadialImageFromColor:fromColor withToColor:toColor withImageSize:size]

/**
 *  创建球形渐变图片
 *
 *  @param colors 颜色值数组
 *  @param size 图片大小
 *
 *  @return 渐变图片
 */
#define HNRadialGradientImageByColorsWithSize(colors,size) [HNImageUitil gradientRadialImageFromColors:colors withImageSize:size]

/**
 *  创建网格线图片
 *
 *  @param lineGap 格线距离
 *  @param color   格线颜色
 *  @param size    图片大小
 *
 *  @return 网格线图片
 */
#define HNGridImageByLineGapAndColorWithSize(lineGap,color,size) [HNImageUitil gridImageByHoriLineGap:lineGap withVerticalLineGap:lineGap withLineColor:color withImageSize:size]

/**
 *  创建水平网格线图片
 *
 *  @param lineGap 格线距离
 *  @param color   格线颜色
 *  @param size    图片大小
 *
 *  @return 网格线图片
 */
#define HNGridImageHorizByLineGapAndColorWithSize(lineGap,color,size) [HNImageUitil gridImageHorizonByLineGap:lineGap withLineColor:color withImageSize:size]

/**
 *  创建垂直网格线图片
 *
 *  @param lineGap 格线距离
 *  @param color   格线颜色
 *  @param size    图片大小
 *
 *  @return 网格线图片
 */
#define HNGridImageVerticalByLineGapAndColorWithSize(lineGap,color,size) [HNImageUitil gridImageVerticalByLineGap:lineGap withLineColor:color withImageSize:size]

/**
 *  快速从文件夹读取图片
 */
#define HNQuickImageByFilePath(filePath) [HNImageUitil imageWithFilePath:filePath]

/**
 *  快速从归档路径读取图片
 */
#define HNQuickUnArchievedImage(filePath) [HNImageUitil imageUnArchievedFromFilePath:filePath]

/**
 *  获取拉伸的图片
 *
 *  @param image      原图片
 *  @param leftOffset 左边起始位置
 *  @param topOffset  顶部起始位置
 *
 *  @return 返回拉伸后的图片
 */
#define HNImageStrecth(image,leftOffset,topOffset) [HNImageUitil stretchImage:image withTopOffset:topOffset withLeftOffset:leftOffset]

/**
 *  获取重设大小拉伸后的图片
 *
 *  @param image  原图片
 *  @param top    顶部起始位置
 *  @param bottom 底部起始位置
 *  @param left   左边起始位置
 *  @param right  右边起始位置
 *
 *  @return 重设大小拉伸后后的图片
 */
#define HNImageResize(image,top,bottom,left,right) [HNImageUitil resizeImage:image withEdgeTop:top withEdgeBottom:bottom withEdgeLeft:left withEdgeRight:right]



#endif /* HNImageUitilDefine_h */
