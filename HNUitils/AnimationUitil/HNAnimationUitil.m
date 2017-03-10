//
//  HNAnimationUitil.m
//  Animation
//
//  Created by xydtech on 16/7/29.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import "HNAnimationUitil.h"

#define kHNAnimationDegreeToAngle(degree) @(degree / 180 * M_PI)

@implementation HNAnimationUitil

+ (void)rotationViewX:(UIView *)view withDegree:(CGFloat)degree withDuration:(NSTimeInterval)duration
{
    [HNAnimationUitil animationView:view withAnimationPath:@"transform.rotation.x" toValue:kHNAnimationDegreeToAngle(degree) withDuration:duration];
}

+ (void)rotationViewY:(UIView *)view withDegree:(CGFloat)degree withDuration:(NSTimeInterval)duration
{
    [HNAnimationUitil animationView:view withAnimationPath:@"transform.rotation.y" toValue:kHNAnimationDegreeToAngle(degree) withDuration:duration];
}

+ (void)rotationViewZ:(UIView *)view withDegree:(CGFloat)degree withDuration:(NSTimeInterval)duration
{
    [HNAnimationUitil animationView:view withAnimationPath:@"transform.rotation.z" toValue:kHNAnimationDegreeToAngle(degree) withDuration:duration];
}

+ (void)translationViewX:(UIView *)view withOriginX:(CGFloat)originX withDuration:(NSTimeInterval)duration
{
    [HNAnimationUitil animationView:view withAnimationPath:@"transform.translation.x" toValue:@(originX) withDuration:duration];
}

+ (void)translationViewY:(UIView *)view withOriginY:(CGFloat)originY withDuration:(NSTimeInterval)duration
{
    [HNAnimationUitil animationView:view withAnimationPath:@"transform.translation.y" toValue:@(originY) withDuration:duration];
}

+ (void)translationViewZ:(UIView *)view withOriginZ:(CGFloat)originZ withDuration:(NSTimeInterval)duration
{
    [HNAnimationUitil animationView:view withAnimationPath:@"transform.translation.z" toValue:@(originZ) withDuration:duration];
}

+ (void)scaleViewX:(UIView *)view withScaleScale:(CGFloat)scale withDuration:(NSTimeInterval)duration
{
    [HNAnimationUitil animationView:view withAnimationPath:@"transform.scale.x" toValue:@(scale) withDuration:duration];
}

+ (void)scaleViewY:(UIView *)view withScaleScale:(CGFloat)scale withDuration:(NSTimeInterval)duration
{
    [HNAnimationUitil animationView:view withAnimationPath:@"transform.scale.y" toValue:@(scale) withDuration:duration];
}

+ (void)scaleViewZ:(UIView *)view withScaleScale:(CGFloat)scale withDuration:(NSTimeInterval)duration
{
    [HNAnimationUitil animationView:view withAnimationPath:@"transform.scale.z" toValue:@(scale) withDuration:duration];
}

+ (void)animationView:(UIView *)view withAnimationPath:(NSString *)path toValue:(NSValue *)value withDuration:(NSTimeInterval)duration
{
    if (!view || [view isKindOfClass:[NSNull class]]) {
        return;
    }
    
    CABasicAnimation * basicAnimation = [CABasicAnimation animationWithKeyPath:path];
    basicAnimation.toValue = value;
    basicAnimation.duration = duration;
    basicAnimation.autoreverses = YES;
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [view.layer addAnimation:basicAnimation forKey:nil];
}


@end
