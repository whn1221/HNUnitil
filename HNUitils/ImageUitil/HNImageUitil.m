//
//  HNImageUitil.m
//  dongdong
//
//  Created by xydtech on 16/7/27.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import "HNImageUitil.h"

@implementation HNImageUitil

/* 根据颜色创建图片 */
+ (UIImage *)imageForColor:(UIColor*)aColor withSize:(CGSize)aSize
{
    if (HNCheckObjectNull(aColor)) {
        return nil;
    }
    
    CGRect rect = CGRectMake(0, 0, aSize.width, aSize.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, aColor.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

+ (UIImage *)viewScreenShot:(UIView *)aView
{
    return [HNImageUitil layerScreenShot:aView.layer];
}

+ (UIImage *)layerScreenShot:(CALayer *)layer
{
    if (HNCheckObjectNull(layer)) {
        return nil;
    }
    
    UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.opaque, 0.0f);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)combineImage:(UIImage *)backgroundImage withMaskImage:(UIImage *)maskImage
{
    if (HNCheckObjectNull(backgroundImage)) {
        return nil;
    }
    UIGraphicsBeginImageContext(backgroundImage.size);
    
    // 绘制改变大小的图片
    CGRect newImageFrame = CGRectMake(0, 0,backgroundImage.size.width, backgroundImage.size.height);
    
    [backgroundImage drawInRect:newImageFrame];
    
    CGFloat originX = (newImageFrame.size.width - maskImage.size.width)/2;
    CGFloat originY = (newImageFrame.size.height - maskImage.size.height)/2;
    
    CGRect maskImageFrame = CGRectMake(originX, originY, maskImage.size.width, maskImage.size.height);
    
    [maskImage drawInRect:maskImageFrame];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
    
}

+ (UIImage *)fixOretationImage:(UIImage *)aImage
{
    if (!aImage) {
        return nil;
    }
    
    // 正确的方向
    if (aImage.imageOrientation == UIImageOrientationUp){
        
        CGSize scaleSize = aImage.size;
        
        UIGraphicsBeginImageContext(scaleSize);
        
        // 绘制改变大小的图片
        [aImage drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
        
        UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return scaledImage;
    }
    
    // 错误的方向
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // 创建一张新图
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    
    return img;
}

+ (UIImage *)partImage:(UIImage *)aImage withRect:(CGRect)partRect
{
    if (HNCheckObjectNull(aImage)) {
        return nil;
    }
    
    CGImageRef imager = CGImageCreateWithImageInRect(aImage.CGImage,partRect);
    
    UIImage *partImage = [UIImage imageWithCGImage:imager];
    
    CGImageRelease(imager);
    
    return partImage;
    
}

+ (UIImage *)correctFullSolutionImageFromALAsset:(ALAsset *)asset withScaleSize:(CGFloat)scaleSize
{
    if (HNCheckObjectNull(asset)) {
        return nil;
    }
    
    ALAssetRepresentation *defaultReprensent = [asset defaultRepresentation];
    
    UIImage *fullSolutionImage = [UIImage imageWithCGImage:defaultReprensent.fullResolutionImage scale:1.0 orientation:(UIImageOrientation)[defaultReprensent orientation]];
    
    return [HNImageUitil correctImageOrientation:fullSolutionImage withScaleSize:scaleSize];
}

+ (UIImage *)correctFullSolutionImageFromALAsset:(ALAsset *)asset
{
    return [HNImageUitil correctFullSolutionImageFromALAsset:asset withScaleSize:1.0];
}

+ (UIImage *)correctImageOrientation:(UIImage *)aImage
{
    return [HNImageUitil correctImageOrientation:aImage withScaleSize:1.0];
}

+ (UIImage *)correctImageOrientation:(UIImage *)aImage  withScaleSize:(CGFloat)scale
{
    if (HNCheckObjectNull(aImage)) {
        return nil;
    }
    
    // 正确的方向
    if (aImage.imageOrientation == UIImageOrientationUp){
        
        CGSize scaleSize = CGSizeMake(aImage.size.width * scale, aImage.size.height * scale);
        
        UIGraphicsBeginImageContext(scaleSize);
        
        // 绘制改变大小的图片
        [aImage drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
        
        UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return scaledImage;
    }
    
    // 错误的方向
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // 创建一张新图
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    
    CGSize scaleSize = CGSizeMake(aImage.size.width * scale, aImage.size.height * scale);
    
    UIGraphicsBeginImageContext(scaleSize);
    
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
    
}

+ (UIImage *)roundImage:(UIImage *)aImage
{
    if (HNCheckObjectNull(aImage)) {
        return nil;
    }
    
    /* 取最小边，否则会出现椭圆 */
    CGFloat itemWidth = MIN(aImage.size.width, aImage.size.height);
    
    //取中心
    CGFloat originX = (aImage.size.width - itemWidth)/2;
    CGFloat originY = (aImage.size.height - itemWidth)/2;
    CGRect imageRect = (CGRect){originX,originY,itemWidth,itemWidth};
    aImage = [HNImageUitil partImage:aImage withRect:imageRect];
    imageRect.origin = CGPointZero;//恢复
    
    UIGraphicsBeginImageContextWithOptions((CGSize){itemWidth,itemWidth}, 1.0, 0.0f);
    
    CGColorSpaceRef maskColorSpaceRef = CGColorSpaceCreateDeviceGray();
    CGContextRef mainMaskContextRef = CGBitmapContextCreate(NULL,
                                                            imageRect.size.width,
                                                            imageRect.size.height,
                                                            8,
                                                            imageRect.size.width,
                                                            maskColorSpaceRef,
                                                            0);
    CGContextFillRect(mainMaskContextRef, imageRect);
    CGContextSetFillColorWithColor(mainMaskContextRef,[UIColor whiteColor].CGColor);
    
    // Create main mask shape
    CGContextMoveToPoint(mainMaskContextRef, 0, 0);
    CGContextAddEllipseInRect(mainMaskContextRef, imageRect);
    CGContextFillPath(mainMaskContextRef);
    
    CGImageRef mainMaskImageRef = CGBitmapContextCreateImage(mainMaskContextRef);
    CGContextRelease(mainMaskContextRef);
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contextRef);
    
    CGImageRef imageRef = CGImageCreateWithMask(aImage.CGImage, mainMaskImageRef);
    
    CGContextTranslateCTM(contextRef, 0, imageRect.size.height);
    CGContextScaleCTM(contextRef, 1.0, -1.0);
    
    CGContextSaveGState(contextRef);
    
    
    UIImage* image = [UIImage imageWithCGImage:imageRef];
    
    CGImageRelease(imageRef);
    CGImageRelease(mainMaskImageRef);
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithName:(NSString *)imageName
{
    if (HNStringIsNull(imageName)) {
        return nil;
    }
    return [UIImage imageNamed:imageName];
}

+ (UIImage *)imageWithFilePath:(NSString *)filePath
{
    if (HNStringIsNull(filePath)) {
        return nil;
    }
    return [UIImage imageWithContentsOfFile:filePath];
}

+ (UIImage *)imageUnArchievedFromFilePath:(NSString *)filePath
{
    if (HNStringIsNull(filePath)) {
        return nil;
    }
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

+ (UIImage *)gradientLinearImageFromColor:(UIColor *)fromColor withToColor:(UIColor *)toColor withImageSize:(CGSize)size
{
    return [HNImageUitil gradientLinearImageFromColors:@[fromColor,toColor,fromColor] withImageSize:size];
}

+ (UIImage *)gradientLinearImageFromColors:(NSArray *)colors withImageSize:(CGSize)size;
{
    if (HNCheckObjectNull(colors)) {
        return nil;
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat _locations[] = {0.f,0.5f,1.f};
    
    NSMutableArray *_colors = [NSMutableArray array];
    
    id fromColor = nil;
    if (colors.count >= 1) {
        fromColor = (__bridge id)[(UIColor *)[colors objectAtIndex:0] CGColor];
    }
    
    id toColor = nil;
    if (colors.count >= 2) {
        toColor = (__bridge id)[(UIColor *)[colors objectAtIndex:1] CGColor];
    }
    
    id endColor = nil;
    if (colors.count == 3) {
        endColor  = (__bridge id)[(UIColor *)[colors objectAtIndex:2] CGColor];
    }
    
    if (fromColor) {
        [_colors addObject:fromColor];
    }
    if (toColor) {
        [_colors addObject:toColor];
    }
    if (endColor) {
        [_colors addObject:endColor];
    }
    
    CGGradientRef gradient =  CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)_colors, _locations);
    
    CGPoint startPoint = CGPointMake(floorf(size.width), 0);
    
    CGPoint endPoint = CGPointMake(floorf(size.width), size.height);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    CFRelease(gradient);
    
    CFRelease(colorSpace);
    
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return gradientImage;
    
}

+ (UIImage *)gradientRadialImageFromColor:(UIColor *)fromColor withToColor:(UIColor *)toColor withImageSize:(CGSize)size
{
    return [HNImageUitil gradientRadialImageFromColors:@[fromColor,toColor] withImageSize:size];
}

+ (UIImage *)gradientRadialImageFromColors:(NSArray *)colors withImageSize:(CGSize)size
{
    if (HNCheckObjectNull(colors)) {
        return nil;
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat _locations[] = {0.f,0.5,1.f};
    
    NSMutableArray *_colors = [NSMutableArray array];
    
    id fromColor = nil;
    if (colors.count >= 1) {
        fromColor = (__bridge id)[(UIColor *)[colors objectAtIndex:0] CGColor];
    }
    
    id toColor = nil;
    if (colors.count >= 2) {
        toColor = (__bridge id)[(UIColor *)[colors objectAtIndex:1] CGColor];
    }
    
    id endColor = nil;
    if (colors.count == 3) {
        endColor  = (__bridge id)[(UIColor *)[colors objectAtIndex:2] CGColor];
    }
    
    if (fromColor) {
        [_colors addObject:fromColor];
    }
    if (toColor) {
        [_colors addObject:toColor];
    }
    if (endColor) {
        [_colors addObject:endColor];
    }
    
    CGGradientRef gradient =  CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)_colors, _locations);
    
    CGPoint startPoint = CGPointMake(floorf(size.width/2), size.height/2);
    
    CGFloat radius = MIN(size.width/2, size.height/2);
    CGContextDrawRadialGradient(context, gradient, startPoint, 0, startPoint,radius, kCGGradientDrawsBeforeStartLocation|kCGGradientDrawsAfterEndLocation);
    
    CFRelease(gradient);
    
    CFRelease(colorSpace);
    
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return gradientImage;
}

+ (UIImage *)gridImageHorizonByLineGap:(CGFloat)lineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size
{
    return [HNImageUitil gridImageByHoriLineGap:lineGap withVerticalLineGap:0.f withLineColor:lineColor withImageSize:size];
}

+ (UIImage *)gridImageVerticalByLineGap:(CGFloat)lineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size
{
    return [HNImageUitil gridImageByHoriLineGap:0.f withVerticalLineGap:lineGap withLineColor:lineColor withImageSize:size];
}

+ (UIImage *)gridImageByHoriLineGap:(CGFloat)hLineGap withVerticalLineGap:(CGFloat)vLineGap withLineColor:(UIColor *)lineColor withImageSize:(CGSize)size
{
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    
    if (hLineGap > 0.f) {
        
        for (int y=0; y < height; y=y+hLineGap) {
            
            CGContextBeginPath(context);
            
            CGContextMoveToPoint(context, 0, y);
            
            CGContextAddLineToPoint(context, width, y);
            
            CGContextStrokePath(context);
        }
    }
    
    if (vLineGap > 0.f) {
        
        for (int x=0; x<width; x=x+vLineGap) {
            
            CGContextBeginPath(context);
            
            CGContextMoveToPoint(context, x, 0);
            
            CGContextAddLineToPoint(context, x, height);
            
            CGContextStrokePath(context);
        }
    }
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

+ (UIImage *)stretchImage:(UIImage *)originImage withTopOffset:(CGFloat)top withLeftOffset:(CGFloat)left
{
    if (HNCheckObjectNull(originImage)) {
        return nil;
    }
    return [originImage stretchableImageWithLeftCapWidth:left topCapHeight:top];
}

+ (UIImage *)resizeImage:(UIImage *)originImage withEdgeTop:(CGFloat)top withEdgeBottom:(CGFloat)bottom withEdgeLeft:(CGFloat)left withEdgeRight:(CGFloat)right
{
    if (HNCheckObjectNull(originImage)) {
        return nil;
    }
    return [originImage resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, bottom, right) resizingMode:UIImageResizingModeStretch];
}

#pragma mark - 获取圆角图片
+ (UIImage *)createRoundCornerImage:(UIImage *)aImage withCornerSize:(NSInteger)cornerSize withBoardSize:(NSInteger)boardSize
{
    if (!aImage) {
        return nil;
    }
    return [HNImageUitil roundedCornerImage:aImage cornerSize:cornerSize borderSize:boardSize];
}

// Returns true if the image has an alpha layer
+ (BOOL)hasAlpha:(UIImage *)aImage {
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(aImage.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

// Returns a copy of the given image, adding an alpha channel if it doesn't already have one
+ (UIImage *)imageWithAlpha:(UIImage *)aImage {
    if ([HNImageUitil hasAlpha:aImage]) {
        return aImage;
    }
    
    CGFloat scale = MAX(aImage.scale, 1.0f);
    CGImageRef imageRef = aImage.CGImage;
    size_t width = CGImageGetWidth(imageRef)*scale;
    size_t height = CGImageGetHeight(imageRef)*scale;
    
    // The bitsPerComponent and bitmapInfo values are hard-coded to prevent an "unsupported parameter combination" error
    CGContextRef offscreenContext = CGBitmapContextCreate(NULL,
                                                          width,
                                                          height,
                                                          8,
                                                          0,
                                                          CGImageGetColorSpace(imageRef),
                                                          kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);
    
    // Draw the image into the context and retrieve the new image, which will now have an alpha layer
    CGContextDrawImage(offscreenContext, CGRectMake(0, 0, width, height), imageRef);
    CGImageRef imageRefWithAlpha = CGBitmapContextCreateImage(offscreenContext);
    UIImage *imageWithAlpha = [UIImage imageWithCGImage:imageRefWithAlpha scale:aImage.scale orientation:UIImageOrientationUp];
    
    // Clean up
    CGContextRelease(offscreenContext);
    CGImageRelease(imageRefWithAlpha);
    
    return imageWithAlpha;
}

// Creates a copy of this image with rounded corners
// If borderSize is non-zero, a transparent border of the given size will also be added
// Original author: Björn Sållarp. Used with permission. See: http://blog.sallarp.com/iphone-uiimage-round-corners/
+ (UIImage *)roundedCornerImage:(UIImage *)aImage cornerSize:(NSInteger)cornerSize borderSize:(NSInteger)borderSize {
    // If the image does not have an alpha layer, add one
    UIImage *image = [HNImageUitil imageWithAlpha:aImage];
    
    CGFloat scale = MAX(aImage.scale,1.0f);
    NSUInteger scaledBorderSize = borderSize * scale;
    
    // Build a context that's the same dimensions as the new size
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 image.size.width*scale,
                                                 image.size.height*scale,
                                                 CGImageGetBitsPerComponent(image.CGImage),
                                                 0,
                                                 CGImageGetColorSpace(image.CGImage),
                                                 CGImageGetBitmapInfo(image.CGImage));
    
    // Create a clipping path with rounded corners
    
    CGContextBeginPath(context);
    [HNImageUitil addRoundedRectToPath:CGRectMake(scaledBorderSize, scaledBorderSize, image.size.width*scale - borderSize * 2, image.size.height*scale - borderSize * 2)
                                   context:context
                                 ovalWidth:cornerSize*scale
                                ovalHeight:cornerSize*scale];
    CGContextClosePath(context);
    CGContextClip(context);
    
    // Draw the image to the context; the clipping path will make anything outside the rounded rect transparent
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width*scale, image.size.height*scale), image.CGImage);
    
    // Create a CGImage from the context
    CGImageRef clippedImage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    
    // Create a UIImage from the CGImage
    UIImage *roundedImage = [UIImage imageWithCGImage:clippedImage scale:aImage.scale orientation:UIImageOrientationUp];
    
    CGImageRelease(clippedImage);
    
    return roundedImage;
}

#pragma mark -
#pragma mark Private helper methods

// Adds a rectangular path to the given context and rounds its corners by the given extents
// Original author: Björn Sållarp. Used with permission. See: http://blog.sallarp.com/iphone-uiimage-round-corners/
+ (void)addRoundedRectToPath:(CGRect)rect context:(CGContextRef)context ovalWidth:(CGFloat)ovalWidth ovalHeight:(CGFloat)ovalHeight {
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    CGFloat fw = CGRectGetWidth(rect) / ovalWidth;
    CGFloat fh = CGRectGetHeight(rect) / ovalHeight;
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}


@end
