
//
//  HNSystemUitisDefine.h
//  dongdong
//
//  Created by xydtech on 16/7/26.
//  Copyright © 2016年 xydtech. All rights reserved.
//

/**
 *  文件描述
 *
 *  这个文件封装了大部分系统相关的功能宏定义
 */


#ifndef HNSystemUitisDefine_h
#define HNSystemUitisDefine_h

#import "HNSystemUitil.h"

/**
 *  去除performSelector警告
 *
 *  @param code 需要屏蔽警告的代码
 *
 *  @return
 */
#define HNSystemRemovePerformSelectorLeakWarning(code)                    \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")     \
code;                                                                   \
_Pragma("clang diagnostic pop")                                         \

/**
 *  当前App的版本号
 */
#define HNSystemAppVersion [HNSystemUitil appVersion]

/**
 *  当前App的版本号 float型
 */
#define HNSystemAppFloatVersion [HNSystemUitil appFloatVersion]

/**
 *  当前App的版本号 字符串型
 */
#define HNSystemAppStringVersion [HNSystemUitil appStringVersion]

/**
 *  当前App的bundleIdentifier
 */
#define HNSystemAppBundleIdentifier [HNSystemUitil appBundleIdentifier]

/**
 *  屏幕绝对画布
 */
#define HNSystemScreenBounds [HNSystemUitil screenBounds]

/**
 *  获取系统版本号
 */
#define HNSystemVersion [HNSystemUitil currentSystemVersion]

/**
 *  当前屏幕缩放倍数
 */
#define HNScreenScale [HNSystemUitil currentScreenScale]

/**
 *  系统是否超过5.0
 */
#define HNSystemIsOver5 [HNSystemUitil isSystemVersionOver:5.0]

/**
 *  系统是否超过6.0
 */
#define HNSystemIsOver6 [HNSystemUitil isSystemVersionOver:6.0]

/**
 *  系统是否超过7.0
 */
#define HNSystemIsOver7 [HNSystemUitil isSystemVersionOver:7.0]

/**
 *  系统是否超过8.0
 */
#define HNSystemIsOver8 [HNSystemUitil isSystemVersionOver:8.0]

/**
 *  获取屏幕大小
 */
#define HNSystemScreenSize [HNSystemUitil deviceScreenSize]

/**
 *  获取屏幕宽度
 */
#define HNSystemScreenWidth [HNSystemUitil deviceScreenSize].width

/**
 *  获取屏幕高度
 */
#define HNSystemScreenHeight [HNSystemUitil deviceScreenSize].height

/**
 *  是否iPhone4
 */
#define HNSystemiPhone4 [HNSystemUitil iPhone4Device]

/**
 *  是否iPhone5
 */
#define HNSystemiPhone5 [HNSystemUitil iPhone5Device]

/**
 *  是否iPhone6
 */
#define HNSystemiPhone6 [HNSystemUitil iPhone6Device]

/**
 *  是否iPhone6 plus
 */
#define HNSystemiPhone6Plus [HNSystemUitil iPhone6PlusDevice]

/**
 *  是否iPad
 */
#define HNSystemiPad [HNSystemUitil iPadDevice]

/**
 *  系统UINavigationBar高度
 */
#define HNSystemNavigationBarHeight [HNSystemUitil naivationBarHeight]

/**
 *  Y轴增量
 */
#define HNSystemOriginYDelta 20.f

/**
 *  AppDelegate
 */
#define HNApplicationDelegate [UIApplication shareApplication].delegate

/**
 *  创建对象弱引用
 */
#define HNWeakObject(anObject)  __weak __typeof(anObject)

/**
 *  创建对象强引用
 */
#define HNStrongObject(anObject) __strong __typeof(anObject)

/**
 *  创建self弱引用
 */
#define HNWeakSelf HNWeakObject(self)

/**
 *  创建self强引用
 */
#define HNStrongSelf HNStrongObject(HNWeakSelf)

/**
 *  系统通知中心
 */
#define HNNotificationCenter [HNSystemUitil defaultCenter]

/**
 *  系统通知中心发noti名字的通知
 */
#define HNNotificationPost(noti) [HNSystemUitil postNoti:noti]

/**
 *  系统通知中心发noti名字的通知，携带参数对象object
 */
#define HNNotificationPostObj(noti,object) [HNSystemUitil postNoti:noti withObject:object]

/**
 *  系统通知中心发noti名字的通知，携带参数对象object ,携带用户自定义信息userInfo
 */
#define HNNotificationPostObjUserInfo(noti,object,userInfo) [HNSystemUitil postNoti:noti withObject:object withUserInfo:userInfo]

/**
 *  获取mainBundle
 */
#define HNMainBundle [NSBundle mainBundle]

/**
 *  获取mainBundle内名字为fileName的文件的路径
 */
#define HNMainBundlePath(fileName) [HNSystemUitil mainBundlePath:fileName]

/**
 *  获取路径为bundlePath的指定bundle中文件名为fileName的文件路径
 */
#define HNBundlePath(bundlePath,fileName) [HNSystemUitil bundle:bundlePath file:fileName]


/**
 *  运行时给一个对象添加一个成员，添加的associateKey必须是一个静态常量字符串 static NSString * const associateKey = @"";
 */
#define HNAssociateOriginWithObject(originObj,associateObj,associateKey) [HNSystemUitil originObject:originObj associateObject:associateObj byKey:associateKey]

/**
 *  通过key获取运行时加入的成员
 */
#define HNGetAssociateObject(originObj,associateKey) [HNSystemUitil associateObjectFromOrigin:originObj byKey:associateKey]

/**
 *  移除辅助成员
 */
#define HNAssociateRemove(originObj) [HNSystemUitil associateRemoveFromOrigin:originObj]

/**
 *  照相机是否可用
 */
#define HNCameraIsAvailable [HNSystemUitil cameraAvailable]

/**
 *  前置摄像头是否可用
 */
#define HNFrontCameraAvailable [HNSystemUitil frontCameraAvailable]

/**
 *  照相机闪光灯是否可用
 */
#define HNCameraFlashAvailable [HNSystemUitil cameraFlashAvailable]

/**
 *  是否支持发短信
 */
#define HNSystemCanSendSMS [HNSystemUitil canSendSMS]

/**
 *  是否支持打电话
 */
#define HNSystemCanMakePhoneCall [HNSystemUitil canMakePhoneCall]

/**
 *  App是否有权限访问照片库
 */
#define HNAppCanAccessPhotoLibrary [HNSystemUitil isAppPhotoLibraryAccessAuthorized]

/**
 *  App是否有权限访问相机
 */
#define HNAppCanAccessCamera [HNSystemUitil isAppCameraAccessAuthorized]

/**
 *  获取屏幕Y轴起始点
 */
#define HNAppSelfViewFrameOrangeY [HNSystemUitil getSelfViewFrameOrangeY]

/**
 *  系统是否 >=7.0 <7.1
 */
#define HNSystemVersionIs7 [HNSystemUitil isSystemVersionIs7]

#endif /* HNSystemUitisDefine_h */
