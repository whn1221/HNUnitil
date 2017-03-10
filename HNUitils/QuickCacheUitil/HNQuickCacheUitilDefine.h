//
//  HNQuickCacheUitilDefine.h
//  dongdong
//
//  Created by xydtech on 16/7/26.
//  Copyright © 2016年 xydtech. All rights reserved.
//

/**
 *  文件描述
 *
 *  这个工具类宏定义封装了对
 *  NSUserDefault,NSCache,NSFileManager
 *  NSKeyedArchieve,NSDocumentDirectory,NSCacheDirectory的便捷操作
 */


#ifndef HNQuickCacheUitilDefine_h
#define HNQuickCacheUitilDefine_h


#import "HNQuickCacheUitil.h"

/* 写宏定义的时候，前面变量参数的名字，多参数的时候不能方法名和后面调用方法的参数名字一样 */

/**
 *  检查一个valueObj,keyObj对象是否有一个是空的
 */
#define HNCheckKeyValueHasNull(keyObj,valueObj) [HNQuickCacheUitil checkValue:valueObj key:keyObj]

/**
 *  检查一个对象是否为空
 */
#define HNCheckObjectNull(object) [HNQuickCacheUitil isNullObject:object]

/**
 *  NSUserDefault 保存键值对 keyObj,valueObj
 */
#define HNUDFCache(keyObj,valueObj) [HNQuickCacheUitil userDefaultCache:valueObj key:keyObj]

/**
 *  NSUserDefault 删除键keyObj对应的值
 */
#define HNUDFRemove(keyObj) [HNQuickCacheUitil userDefaultRemove:keyObj]

/**
 *  NSUserDefault 获取键keyObj对应的值
 */
#define HNUDFGetValue(keyObj) [HNQuickCacheUitil userDefaultGetValue:keyObj]

/**
 *  NSUserDefault 判断键keyObject对应的值是否为空
 */
#define HNUDFEmptyValue(keyObj) [HNQuickCacheUitil userDefaultEmptyValue:keyObj]

/**
 *  NSCache 存储键值对 keyObj,valueObj
 */
#define HNNSCacheSet(keyObj,valueObj) [HNQuickCacheUitil systemMemoryCacheSet:valueObj key:keyObj]

/**
 *  NSCache 删除键keyObj对应的值
 */
#define HNNSCacheRemove(keyObj) [HNQuickCacheUitil systemMemoryCacheRemove:keyObj]

/**
 *  NSCache 获取键keyObj对应的值
 */
#define HNNSCacheGetValue(keyObj) [HNQuickCacheUitil systemMemoryCacheGetValue:keyObj]

/**
 *  NSCache 判断键keyObject对应的值是否为空
 */
#define HNNSCacheEmptyValue(keyObj) [HNQuickCacheUitil systemMemoryCacheEmptyValue:keyObj]

/**
 *  获取系统默认文件管理
 */
#define HNFileManager [HNQuickCacheUitil fileManager]

/**
 *  指定路径pathObj是否存在文件
 */
#define HNFileIsExist(pathObj) [HNQuickCacheUitil fileExist:pathObj]

/**
 *  指定路径pathObj是否存在目录
 */
#define HNFileDirectoryIsExist(pathObj) [HNQuickCacheUitil directoryExist:pathObj]

/**
 *  读取某个路径的二进制数据，返回 NSData
 */
#define HNFileRead(pathObj) [HNQuickCacheUitil readFromFile:pathObj]

/**
 *  将二进制数据写入文件 dataObj:NSData pathObj:NSString
 */
#define HNFileWrite(dataObj,pathObj) [HNQuickCacheUitil writeFileData:dataObj toPath:pathObj]

/**
 *  在指定路径创建目录，返回BOOL结果
 */
#define HNFileDirectoryCreate(pathObj) [HNQuickCacheUitil createDirectory:pathObj]

/**
 *  删除指定路径文件
 */
#define HNFileDeleteFile(path) [HNQuickCacheUitil deleteFileAtPath:path]

/**
 *  删除指定目录
 */
#define HNFileDeleteDirectory(path) [HNQuickCacheUitil deleteDirectoryAtPath:path]

/**
 *  从fromFilePath复制文件到toFilePath,shouldRemove标示是否删除复制源文件
 */
#define HNFileCopyFileIsRemove(fromFilePath,toFilePath,shouldRemove) [HNQuickCacheUitil copyFileFromPath:fromFilePath toPath:toFilePath isRemoveOld:shouldRemove]

/**
 *  将某个对象归档到指定路径
 */
#define HNArchieveObject(object,filePath) [HNQuickCacheUitil archieveObject:object toFilePath:filePath]

/**
 *  从指定路径读取被归档过的对象
 */
#define HNUnArchieveObject(fromFilePath) [HNQuickCacheUitil unarchieveFromPath:fromFilePath]

/**
 *  获取NSDocumentDirectory目录
 */
#define HNAppDocumentDirectory [HNQuickCacheUitil documentDirectory]

/**
 *  获取NSCacheDirectory目录
 */
#define HNAppCacheDirectory [HNQuickCacheUitil cacheDirectory]

/**
 *  返回文件名为fileName在NSDocumentDirectory中的路径
 */
#define HNAppDoucmentPath(fileName) [HNQuickCacheUitil documentDirectoryPath:fileName]

/**
 *  返回文件名为fileName在NSCacheDirectory中的路径
 */
#define HNAppCachePath(fileName) [HNQuickCacheUitil cacheDirectoryPath:fileName]

/**
 *  将object对象用fileName名字保存到NSDocumentDirectory目录下
 */
#define HNAppDocumentSave(object,fileName) [HNQuickCacheUitil documentDirectorySave:object withFileName:fileName]

/**
 *  将object对象用fileName名字保存到NSCacheDirectory目录下
 */
#define HNAppCacheSave(object,fileName) [HNQuickCacheUitil cacheDirectorySave:object withFileName:fileName]

/**
 *  删除NSDocumentDirectory目录下名为fileName的文件
 */
#define HNAppDocumentDelete(fileName)  [HNQuickCacheUitil documentDirectoryDelete:fileName]

/**
 *  删除NSCacheDirectory目录下名为fileName的文件
 */
#define HNAppCacheDelete(fileName) [HNQuickCacheUitil cacheDirectoryDelete:fileName]

#endif /* HNQuickCacheUitilDefine_h */
