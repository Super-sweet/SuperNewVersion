//
//  ViewController.m
//  SuperNewVersion
//
//  Created by xuchao on 16/11/28.
//  Copyright © 2016年 xuchao. All rights reserved.
//

#import "ViewController.h"
#import "XCversion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)openAppStoreClick:(id)sender {
    [XCVersion checkNewVersionWithType:NewVersionTypeAppStore];
}

- (IBAction)openInsideApp:(id)sender {
     [XCVersion checkNewVersionWithType:NewVersionTypeInsiderApp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
