//
//  XCVersionRequest.m
//  demo1
//
//  Created by xuchao on 16/11/25.
//  Copyright © 2016年 xuchao. All rights reserved.
//

#import "XCVersionRequest.h"

@implementation XCVersionRequest

+ (void)XC_versionRequestSuccess:(RequestSucess)success failue:(RequestError)failue {
  NSDictionary * infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString * bundleID = infoDic[@"CFBundleIdentifier"];
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?bundleId=%@",bundleID]];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
        NSURLSessionDataTask * dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           dispatch_async(dispatch_get_main_queue(), ^{
               if (!error) {
                    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                   if (success) {
                       success(responseDict);
                   }else {
                   
                       if (failue) {
                           failue(error);
                       }
                   }
               }
               
           });
            
        }];
        [dataTask resume];
        
    });

    


    

}


@end
