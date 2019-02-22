//
//  PageOneViewController.m
//  DemoB
//
//  Created by yons on 17/2/20.
//  Copyright © 2017年 yons. All rights reserved.
//

#import "PageOneViewController.h"

@interface PageOneViewController ()

@end

@implementation PageOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"pageOne";
    
}
#pragma mark - 返回DemoA
- (IBAction)backDemoA:(id)sender {
    // 1.拿到对应应用程序的URL Scheme 通过约定好的分割符?切割
    NSString *urlSchemeString = [[self.urlString componentsSeparatedByString:@"?"] lastObject];
    NSString *urlString = [urlSchemeString stringByAppendingString:@"://"];
    
    // 2.获取对应应用程序的URL
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 3.判断是否可以打开
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
