//
//  XCAppInfo.m
//  demo1
//
//  Created by xuchao on 16/11/25.
//  Copyright © 2016年 xuchao. All rights reserved.
//

#import "XCAppInfo.h"

@implementation XCAppInfo

- (instancetype)initWithResult:(NSDictionary *)result{
    
    self = [super init];
    if (self) {
        
        self.version = result[@"version"];
        self.releaseNotes = result[@"releaseNotes"];
        self.currentVersionReleaseDate = result[@"currentVersionReleaseDate"];
        self.trackId = result[@"trackId"];
        self.bundleId = result[@"bundleId"];
        self.trackViewUrl = result[@"trackViewUrl"];
        self.appDescription = result[@"appDescription"];
        self.sellerName = result[@"sellerName"];
        self.fileSizeBytes = result[@"fileSizeBytes"];
        self.screenshotUrls = result[@"screenshotUrls"];
    }
    return self;
}



@end
