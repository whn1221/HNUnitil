//
//  HNSystemUitil.h
//  dongdong
//
//  Created by xydtech on 16/7/26.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HNSystemUitil : NSObject

+ (CGFloat)appVersion;

+ (CGFloat)appFloatVersion;

+ (NSString *)appStringVersion;

+ (NSString *)appBundleIdentifier;

+ (CGFloat)currentSystemVersion;

+ (CGFloat)currentScreenScale;

+ (CGRect)screenBounds;

+ (BOOL)isSystemVersionOver:(CGFloat)versionValue;

+ (BOOL)iPadDevice;

+ (BOOL)iPhone4Device;

+ (BOOL)iPhone5Device;

+ (BOOL)iPhone6Device;

+ (BOOL)iPhone6PlusDevice;

+ (CGSize)deviceScreenSize;

+ (CGFloat)naivationBarHeight;

+ (NSNotificationCenter *)defaultCenter;

+ (void)postNoti:(NSString *)notiName;

+ (void)postNoti:(NSString *)notiName withObject:(id)obj;

+ (void)postNoti:(NSString *)notiName withObject:(id)obj withUserInfo:(NSDictionary *)infoDict;

+ (NSString *)mainBundlePath:(NSString*)fileName;

+ (NSString *)bundle:(NSString *)bundle file:(NSString *)file;

+ (void)showNetworkIndicatorActivity:(BOOL)state;

+ (void)originObject:(id)originObject associateObject:(id)anObject byKey:(NSString * const)associateKey;

+ (id)associateObjectFromOrigin:(id)originObject byKey:(NSString * const)associateKey;

+ (void)associateRemoveFromOrigin:(id)originObject;

+ (BOOL)cameraAvailable;

+ (BOOL)frontCameraAvailable;

+ (BOOL)cameraFlashAvailable;

+ (BOOL)canSendSMS;

+ (BOOL)canMakePhoneCall;

+ (BOOL)isAppCameraAccessAuthorized;

+ (BOOL)isAppPhotoLibraryAccessAuthorized;

/**
 *  获取屏幕Y轴起始点
 */
+(double)getSelfViewFrameOrangeY;

/**
 *  系统是否 >=7.0 <7.1
 */
+(BOOL)isSystemVersionIs7;

@end
