//
//  ViewController.m
//  DemoA
//
//  Created by yons on 17/2/20.
//  Copyright © 2017年 yons. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)jumpToDemoB:(id)sender;
- (IBAction)jumpToPageOne:(id)sender;
- (IBAction)jumpToPageTwo:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"DemoA";
}
- (void)showMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)jumpWithUrlString:(NSString *)urlString {
    
    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            
        }];
    }
    else {
        [self showMessage:@"没有该应用"];
    }
}
#pragma mark - DemoA -> DemoB
- (IBAction)jumpToDemoB:(id)sender {
//    NSString *urlString = @"DemoBScheme://";//没有参数
    NSString *urlString = @"demoB://?name=lwy&phone=110";//后面拼接参数
    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            
        }];
    }
    else {
        [self showMessage:@"没有该应用"];
    }
}
#pragma mark - 跳转到pageOne页面
- (IBAction)jumpToPageOne:(id)sender {
    //我们想要从应用B再跳转回应用A，那么在跳转到应用B的时候，还应将应用A的URL Schemes传递过来。这样我们才能判断应该跳转回哪个应用程序。
//    这样我们指定一个传递URL的规则：协议头://应用B的URL Schemes?应用A的URL Schemes。即：AppB://Page1?AppA。
    NSString *urlString = @"DemoBScheme://page1?DemoAScheme";// DemoBScheme:// 是DemoB应用的scheme page1是与DemoB约定好的跳转到PageOne页面的标识符 ?是分割符（当然也可以用其他符号作分割），在DemoB中通过分隔符来截取DemoA的scheme， DemoAScheme是自己的scheme，用来从DemoB跳转回来
    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            
        }];
    }
    else {
        [self showMessage:@"没有该应用"];
    }
}

- (IBAction)jumpToPageTwo:(id)sender {
    NSString *urlString = @"DemoBScheme://page2?DemoAScheme";// DemoBScheme:// 是DemoB应用的scheme page2是与DemoB约定好的跳转到PageOne页面的标识符  ?是分割符（当然也可以用其他符号作分割） DemoAScheme是自己的scheme，用来从DemoB跳转回来
    
    
    [self jumpWithUrlString:urlString];
}
@end
