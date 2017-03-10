//
//  HNAnimationUitil.h
//  Animation
//
//  Created by xydtech on 16/7/29.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HNAnimationUitil : NSObject

/* CAAnimation */

+ (void)rotationViewX:(UIView *)view withDegree:(CGFloat)degree withDuration:(NSTimeInterval)duration;

+ (void)rotationViewY:(UIView *)view withDegree:(CGFloat)degree withDuration:(NSTimeInterval)duration;

+ (void)rotationViewZ:(UIView *)view withDegree:(CGFloat)degree withDuration:(NSTimeInterval)duration;

+ (void)translationViewX:(UIView *)view withOriginX:(CGFloat)originX withDuration:(NSTimeInterval)duration;

+ (void)translationViewY:(UIView *)view withOriginY:(CGFloat)originY withDuration:(NSTimeInterval)duration;

+ (void)translationViewZ:(UIView *)view withOriginZ:(CGFloat)originZ withDuration:(NSTimeInterval)duration;

+ (void)scaleViewX:(UIView *)view withScaleScale:(CGFloat)scale withDuration:(NSTimeInterval)duration;

+ (void)scaleViewY:(UIView *)view withScaleScale:(CGFloat)scale withDuration:(NSTimeInterval)duration;

+ (void)scaleViewZ:(UIView *)view withScaleScale:(CGFloat)scale withDuration:(NSTimeInterval)duration;

+ (void)animationView:(UIView *)view withAnimationPath:(NSString *)path toValue:(NSValue *)value withDuration:(NSTimeInterval)duration;


@end
