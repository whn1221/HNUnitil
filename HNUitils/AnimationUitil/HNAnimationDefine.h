
//
//  HNAnimationDefine.h
//  Animation
//
//  Created by xydtech on 16/7/29.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#ifndef HNAnimationDefine_h
#define HNAnimationDefine_h

#import "HNAnimationUitil.h"

/** 以X轴旋转,degree取值为0-360 */
#define HNAnimationRotationX(view, degree, duration) [HNAnimationUitil rotationViewX:view withDegree:degree withDuration:duration]

/** 以Y轴旋转,degree取值为0-360 */
#define HNAnimationRotationY(view, degree, duration) [HNAnimationUitil rotationViewY:view withDegree:degree withDuration:duration]

/** 以Z轴旋转,degree取值为0-360 */
#define HNAnimationRotationZ(view, degree, duration) [HNAnimationUitil rotationViewZ:view withDegree:degree withDuration:duration]

/** 以X轴移动视图 */
#define HNAnimationTranslationX(view, originX, duration) [HNAnimationUitil translationViewX:view withOriginX:originX withDuration:duration]

/** 以Y轴移动视图 */
#define HNAnimationTranslationY(view, originY, duration) [HNAnimationUitil translationViewY:view withOriginY:originY withDuration:duration]

/** 以Z轴移动视图 */
#define HNAnimationTranslationZ(view, originZ, duration) [HNAnimationUitil translationViewZ:view withOriginZ:originZ withDuration:duration]

/** 以X轴缩放视图 */
#define HNAnimationScaleX(view, scale, duration) [HNAnimationUitil scaleViewX:view withScaleScale:scale withDuration:duration]

/** 以Y轴缩放视图 */
#define HNAnimationScaleY(view, scale, duration) [HNAnimationUitil scaleViewY:view withScaleScale:scale withDuration:duration]

/** 以Z轴缩放视图 */
#define HNAnimationScaleZ(view, scale, duration) [HNAnimationUitil scaleViewZ:view withScaleScale:scale withDuration:duration]

#endif /* HNAnimationDefine_h */
