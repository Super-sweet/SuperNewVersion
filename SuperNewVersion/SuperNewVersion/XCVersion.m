//
//  XCversion.m
//  demo1
//
//  Created by xuchao on 16/11/25.
//  Copyright © 2016年 xuchao. All rights reserved.
//

#import "SingleDefine.h"
#import "XCVersion.h"
#import "XCAppInfo.h"
#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

static NewVersionType Newtype;
@interface XCVersion ()<UIAlertViewDelegate,SKStoreProductViewControllerDelegate>


@property(nonatomic,strong)XCAppInfo *appInfo;

@end


@implementation XCVersion

singleton_implementation(XCVersion);
+ (void)checkNewVersionWithType:(NewVersionType)type {

    Newtype = type;
    [[XCVersion sharedInstance] checkNewVersion];


}
- (void)checkNewVersion {

[self versionRequest:^(XCAppInfo *appInfo) {
    NSString *updateMsg = [NSString stringWithFormat:@"%@",appInfo.releaseNotes];
    
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"发现新版本" message:updateMsg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (Newtype == NewVersionTypeAppStore) {
            [self openInAppStoreForAppURL:self.appInfo.trackViewUrl];
            
        }else if(Newtype == NewVersionTypeInsiderApp){
         [self openInStoreProductViewControllerForAppId:self.appInfo.trackId];
        
        }
       
        
    }]];
    
    [[self window].rootViewController presentViewController:alert animated:YES completion:nil];
#endif
    
    
    
}];
  
    
}


- (void)openInStoreProductViewControllerForAppId:(NSString *)appId{
    
    SKStoreProductViewController *storeProductVC = [[SKStoreProductViewController alloc] init];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:appId forKey:SKStoreProductParameterITunesItemIdentifier];
    storeProductVC.delegate = self;
    [storeProductVC loadProductWithParameters:dict completionBlock:^(BOOL result, NSError *error) {
        if (result) {
            
            [[self window].rootViewController presentViewController:storeProductVC animated:YES completion:nil];
        }
    }];
    
}
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    
    [viewController dismissViewControllerAnimated:YES completion:nil];
}
-(UIWindow *)window{
    
    UIWindow *window = nil;
    id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate respondsToSelector:@selector(window)]) {
        window = [delegate performSelector:@selector(window)];
    } else {
        window = [[UIApplication sharedApplication] keyWindow];
    }
    return window;
}
-(void)openInAppStoreForAppURL:(NSString *)appURL{
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURL] options:@{} completionHandler:nil];
#endif
}
- (void)versionRequest:(NewVersionBlock)newInfo {
    [XCVersionRequest XC_versionRequestSuccess:^(NSDictionary *successDic) {
     
        NSInteger resultCount = [successDic[@"resultCount"] integerValue];
        if(resultCount==1)
        {
            NSArray *resultArray = successDic[@"results"];
            NSDictionary *result = resultArray.firstObject;
            XCAppInfo *appInfo = [[XCAppInfo alloc] initWithResult:result];
            NSString *version = appInfo.version;
            self.appInfo = appInfo;
            if([self isNewVersion:version])//新版本
            {
                if(newInfo) newInfo(self.appInfo);
            }
        }
        
        
    } failue:^(NSError *error) {
        NSLog(@"%@",error);
    }];


}

- (BOOL)isNewVersion:(NSString *)newVersion {

    return [self newVersion:newVersion moreThanCurrentVersion:[self currentVersion]];
}

-(NSString *)currentVersion {

NSString * key = @"CFBundleShortVersionString";
    NSString * currentVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:key];
    return currentVersion;
}

-(BOOL)newVersion:(NSString *)newVersion moreThanCurrentVersion:(NSString *)currentVersion {

    if ([currentVersion compare:newVersion options:NSNumericSearch] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}
@end
