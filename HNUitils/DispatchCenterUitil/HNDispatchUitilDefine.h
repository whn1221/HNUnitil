
//
//  HNDispatchUitilDefine.h
//  dongdong
//
//  Created by xydtech on 16/7/26.
//  Copyright © 2016年 xydtech. All rights reserved.
//

/**
 *  文件描述
 *
 *  这个工具类宏可以方便在各种队列中执行block,提供便捷的使用方法
 *  是对GCD的一个简单封装
 */

#ifndef HNDispatchUitilDefine_h
#define HNDispatchUitilDefine_h

#import "HNDispatchUitil.h"

/**
 *  主线程异步执行block
 */
#define HNAsyncMainQueue(block) [HNDispatchUitil asyncMainQueue:block]

/**
 *  主线程延迟second秒异步执行block
 */
#define HNAsyncMainQueueDelay(second,block) [HNDispatchUitil asyncMainQueue:block delay:second]

/**
 *  全局后台线程异步执行block
 */
#define HNAsyncGlobalBackgroundQueue(block) [HNDispatchUitil asyncGlobalBackgroundQueue:block]

/**
 *  全局后台线程延迟second秒异步执行block
 */
#define HNAsyncGlobalBackgroundQueueDelay(second,block) [HNDispatchUitil asyncGlobalBackgroundQueue:block delay:second]

/**
 *  全局高优先级线程异步执行block
 */
#define HNAsyncGlobalHighQueue(block) [HNDispatchUitil asyncGlobalHighQueue:block]

/**
 *  全局高优先级线程延迟second秒异步执行block
 */
#define HNAsyncGlobalHighQueueDelay(second,block) [HNDispatchUitil asyncGlobalHighQueue:block delay:second]

/**
 *  全局低优先级线程异步执行block
 */
#define HNAsyncGlobalLowQueue(block) [HNDispatchUitil asyncGlobalLowQueue:block]

/**
 *  全局低优先级线程延迟second秒异步执行block
 */
#define HNAsyncGlobalLowQueueDelay(second,block) [HNDispatchUitil asyncGlobalLowQueue:block delay:second]

/**
 *  全局默认线程异步执行block
 */
#define HNAsyncGlobalDefaultQueue(block) [HNDispatchUitil asyncGlobalDefaultQueue:block]

/**
 *  全局默认线程延迟second秒异步执行block
 */
#define HNAsyncGlobalDefaultQueueDelay(second,block) [HNDispatchUitil asyncGlobalDefaultQueue:block delay:second]

/**
 *  在queue线程队列异步执行block
 */
#define HNAsync(queue,block)  [HNDispatchUitil asyncQueue:queue action:block]

/**
 *  在queue线程序延迟second秒异步执行block
 */
#define HNAsyncDelay(queue,second,block)  [HNDispatchUitil asyncQueue:queue action:block delay:second]

/**
 *  只执行一次block,创建单例使用
 */
#define HNDispatchOnce(onceToken,block) [HNDispatchUitil dispatchOnce:onceToken action:block]


#endif /* HNDispatchUitilDefine_h */
