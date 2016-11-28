//
//  ViewController.m
//  demo1
//
//  Created by xuchao on 16/11/24.
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
- (IBAction)appstore:(id)sender {
    [XCversion checkNewVersionWithType:NewVersionTypeAppStore];
}

- (IBAction)insideApp:(id)sender {
    [XCversion checkNewVersionWithType:NewVersionTypeInsiderApp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
