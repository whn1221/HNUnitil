//
//  HNQuickCacheUitil.m
//  dongdong
//
//  Created by xydtech on 16/7/26.
//  Copyright © 2016年 xydtech. All rights reserved.
//

#import "HNQuickCacheUitil.h"
#import "HNDispatchUitilDefine.h"

@implementation HNQuickCacheUitil
+ (BOOL)isNullObject:(id)anObject
{
    if (!anObject || [anObject isKindOfClass:[NSNull class]]) {
        return YES;
    }else{
        return NO;
    }
}

+ (BOOL)checkValue:(id)value key:(id)key
{
    if(HNCheckObjectNull(value)||HNCheckObjectNull(key)){
        return YES;
    }else{
        return NO;
    }
}

+ (NSUserDefaults *)standDefault
{
    return [NSUserDefaults standardUserDefaults];
}

+ (void)userDefaultCache:(id<NSCoding>)value key:(id)key
{
    if (HNCheckKeyValueHasNull(key, value)) {
        return;
    }
    [[HNQuickCacheUitil standDefault]setObject:value forKey:key];
}

+ (void)userDefaultRemove:(id)key
{
    if (HNCheckObjectNull(key)) {
        return;
    }
    [[HNQuickCacheUitil standDefault]removeObjectForKey:key];
}

+ (id)userDefaultGetValue:(id)key
{
    if (HNCheckObjectNull(key)) {
        return nil;
    }
    return [[HNQuickCacheUitil standDefault]objectForKey:key];
}

+ (BOOL)userDefaultEmptyValue:(id)key
{
    return [HNQuickCacheUitil userDefaultGetValue:key] == nil;
}

+ (NSCache *)shareCache
{
    static NSCache *_HNNSCacheInstance = nil;
    static dispatch_once_t onceToken;
    
    HNDispatchOnce(onceToken, ^{
        
        if (!_HNNSCacheInstance) {
            _HNNSCacheInstance = [[NSCache alloc]init];
        }
        
    });
    
    return _HNNSCacheInstance;
}

+ (void)systemMemoryCacheSet:(id<NSCoding>)value key:(id)key
{
    if (HNCheckKeyValueHasNull(value, key)) {
        return;
    }
    [[HNQuickCacheUitil shareCache]setObject:value forKey:key];
}

+ (void)systemMemoryCacheRemove:(id)key
{
    if (HNCheckObjectNull(key)) {
        return;
    }
    [[HNQuickCacheUitil shareCache]removeObjectForKey:key];
}

+ (id)systemMemoryCacheGetValue:(id)key
{
    if (HNCheckObjectNull(key)) {
        return nil;
    }
    return [[HNQuickCacheUitil shareCache]objectForKey:key];
}

+ (BOOL)systemMemoryCacheEmptyValue:(id)key
{
    if (HNCheckObjectNull(key)) {
        return NO;
    }
    return [HNQuickCacheUitil systemMemoryCacheGetValue:key] == nil;
}

+ (NSFileManager *)fileManager
{
    return [NSFileManager defaultManager];
}

+ (BOOL)fileExist:(NSString*)path
{
    if (HNStringIsNull(path)) {
        return NO;
    }
    return [[HNQuickCacheUitil fileManager] fileExistsAtPath:path];
}

+ (BOOL)directoryExist:(NSString*)dirPath
{
    if (HNStringIsNull(dirPath)) {
        return NO;
    }
    BOOL isDir = YES;
    
    return [[HNQuickCacheUitil fileManager]fileExistsAtPath:dirPath isDirectory:&isDir];
}

+ (BOOL)createDirectory:(NSString*)dirPath
{
    if (HNCheckObjectNull(dirPath)) {
        return NO;
    }
    if (HNFileDirectoryIsExist(dirPath)) {
        return YES;
    }
    return [[HNQuickCacheUitil fileManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
}

+ (BOOL)writeFileData:(NSData*)data toPath:(NSString *)path
{
    if (HNCheckKeyValueHasNull(data, path)) {
        return NO;
    }
    
    return [data writeToFile:path atomically:YES];
}

+ (NSData *)readFromFile:(NSString *)path
{
    if (HNCheckObjectNull(path)) {
        return nil;
    }
    
    return [NSData dataWithContentsOfFile:path];
}

+ (BOOL)deleteFileAtPath:(NSString *)filePath
{
    if (HNStringIsNull(filePath)) {
        return NO;
    }
    return [HNFileManager removeItemAtPath:filePath error:nil];
}

+ (BOOL)deleteDirectoryAtPath:(NSString *)dirPath
{
    if (HNStringIsNull(dirPath)) {
        return NO;
    }
    return [HNFileManager removeItemAtPath:dirPath error:nil];
}

+ (BOOL)copyFileFromPath:(NSString *)fromPath toPath:(NSString *)toPath isRemoveOld:(BOOL)isRemove
{
    if (HNStringIsNull(fromPath) || HNStringIsNull(toPath) ) {
        return NO;
    }
    if (!HNFileIsExist(fromPath)) {
        return NO;
    }
    
    BOOL copyResult = [HNFileManager copyItemAtPath:fromPath toPath:toPath error:nil];
    if (copyResult) {
        
        if (isRemove) {
            return [HNFileManager removeItemAtPath:fromPath error:nil];
        }
        return YES;
        
    }else{
        return NO;
    }
}

+ (BOOL)archieveObject:(id<NSCoding>)anObject toFilePath:(NSString *)toPath
{
    if (HNCheckObjectNull(anObject) || HNStringIsNull(toPath)) {
        return NO;
    }
    NSData *archieveData = [NSKeyedArchiver archivedDataWithRootObject:anObject];
    if (archieveData) {
        
        return HNFileWrite(archieveData, toPath);
        
    }else{
        return NO;
    }
}

+ (id)unarchieveFromPath:(NSString *)filePath
{
    if (HNStringIsNull(filePath)) {
        return nil;
    }
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

+ (NSString *)documentDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)documentDirectoryPath:(NSString *)file
{
    if (HNStringIsNull(file)) {
        return nil;
    }
    return [[HNQuickCacheUitil documentDirectory]stringByAppendingPathComponent:file];
}

+ (NSString *)cacheDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)cacheDirectoryPath:(NSString *)file
{
    if (HNStringIsNull(file)) {
        return nil;
    }
    return [[HNQuickCacheUitil cacheDirectory]stringByAppendingPathComponent:file];
}

+ (BOOL)cacheDirectorySave:(id<NSCoding>)anObject withFileName:(NSString *)file
{
    if (HNCheckObjectNull(anObject) || HNStringIsNull(file)) {
        return NO;
    }
    
    return HNArchieveObject(anObject, [HNQuickCacheUitil cacheDirectoryPath:file]);
}

+ (BOOL)cacheDirectoryDelete:(NSString *)file
{
    if (HNStringIsNull(file)) {
        return NO;
    }
    return HNFileDeleteFile([HNQuickCacheUitil cacheDirectoryPath:file]);
}


+ (BOOL)documentDirectorySave:(id<NSCoding>)anObject withFileName:(NSString *)file
{
    if (HNCheckObjectNull(anObject) || HNStringIsNull(file)) {
        return NO;
    }
    
    return HNArchieveObject(anObject, [HNQuickCacheUitil documentDirectoryPath:file]);
}

+ (BOOL)documentDirectoryDelete:(NSString *)file
{
    if (HNStringIsNull(file)) {
        return NO;
    }
    return HNFileDeleteFile([HNQuickCacheUitil documentDirectoryPath:file]);
}

@end
