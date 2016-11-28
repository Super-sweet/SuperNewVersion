//
//  SingleDefine.h
//  CosplayChatDemo
//
//  Created by apple on 15/10/26.
//  Copyright © 2015年 Linksee. All rights reserved.
//

#ifndef SingleDefine_h
#define SingleDefine_h

#define singleton_interface(className)\
+ (className *)sharedInstance;

#define singleton_implementation(className) \
static className *_instance; \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, \
    ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
\
+ (className *)sharedInstance \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, \
    ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
}

#endif /* SingleDefine_h */
