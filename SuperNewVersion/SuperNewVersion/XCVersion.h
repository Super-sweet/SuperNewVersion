//
//  XCversion.h
//  demo1
//
//  Created by xuchao on 16/11/25.
//  Copyright © 2016年 xuchao. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "XCVersionRequest.h"
typedef NS_ENUM(NSUInteger, NewVersionType) {
    NewVersionTypeAppStore = 0,
    NewVersionTypeInsiderApp,
};

@class XCAppInfo;

typedef void(^NewVersionBlock)(XCAppInfo* appInfo);
@interface XCVersion : NSObject

+ (void)checkNewVersionWithType:(NewVersionType)type;

@end
