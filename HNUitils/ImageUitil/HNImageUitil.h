//
//  HNImageUitil.h
//  dongdong
//
//  Created by xydtech on 16/7/27.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface HNImageUitil : NSObject

+ (UIImage *)imageWithName:(NSString *)imageName;

+ (UIImage *)imageWithFilePath:(NSString *)filePath;

+ (UIImage *)imageUnArchievedFromFilePath:(NSString *)filePath;

+ (UIImage *)roundImage:(UIImage *)aImage;

+ (UIImage *)partImage:(UIImage *)aImage withRect:(CGRect)partRect;

+ (UIImage *)correctImageOrientation:(UIImage *)aImage;

+ (UIImage *)correctImageOrientation:(UIImage *)aImage withScaleSize:(CGFloat)scale;

+ (UIImage *)correctFullSolutionImageFromALAsset:(ALAsset *)asset;

+ (UIImage *)correctFullSolutionImageFromALAsset:(ALAsset *)asset withScaleSize:(CGFloat)scaleSize;

+ (UIImage *)combineImage:(UIImage *)backgroundImage withMaskImage:(UIImage *)maskImage;

+ (UIImage *)fixOretationImage:(UIImage *)aImage;

+ (UIImage *)createRoundCornerImage:(UIImage *)aImage withCornerSize:(NSInteger)cornerSize withBoardSize:(NSInteger)boardSize;

/* 根据颜色创建图片 */
+ (UIImage *)imageForColor:(UIColor*)aColor withSize:(CGSize)aSize;

+ (UIImage *)gradientLinearImageFromColor:(UIColor *)fromColor withToColor:(UIColor *)toColor withImageSize:(CGSize)size;

+ (UIImage *)gradientLinearImageFromColors:(NSArray *)colors withImageSize:(CGSize)size;

+ (UIImage *)gradientRadialImageFromColor:(UIColor *)fromColor withToColor:(UIColor *)toColor withImageSize:(CGSize)size;

+ (UIImage *)gradientRadialImageFromColors:(NSArray *)colors withImageSize:(CGSize)size;

+ (UIImage *)gridImageHorizonByLineGap:(CGFloat)lineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size;

+ (UIImage *)gridImageVerticalByLineGap:(CGFloat)lineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size;

+ (UIImage *)gridImageByHoriLineGap:(CGFloat)hLineGap withVerticalLineGap:(CGFloat)vLineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size;

/* 图片拉伸 */
+ (UIImage *)stretchImage:(UIImage *)originImage withTopOffset:(CGFloat)top withLeftOffset:(CGFloat)left;

+ (UIImage *)resizeImage:(UIImage *)originImage withEdgeTop:(CGFloat)top withEdgeBottom:(CGFloat)bottom withEdgeLeft:(CGFloat)left withEdgeRight:(CGFloat)right;

+ (UIImage *)viewScreenShot:(UIView *)aView;

+ (UIImage *)layerScreenShot:(CALayer *)layer;

@end
