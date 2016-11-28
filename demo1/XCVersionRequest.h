//
//  XCVersionRequest.h
//  demo1
//
//  Created by xuchao on 16/11/25.
//  Copyright © 2016年 xuchao. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^RequestSucess)(NSDictionary * successDic);
typedef void(^RequestError)(NSError *error);

@interface XCVersionRequest : NSObject


/**
 appStore中获取App信息

 @param success 成功回调
 @param failue  失败回调
 */
+ (void)XC_versionRequestSuccess:(RequestSucess)success failue:(RequestError)failue;

@end
