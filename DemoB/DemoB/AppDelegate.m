//
//  AppDelegate.m
//  DemoB
//
//  Created by yons on 17/2/20.
//  Copyright © 2017年 yons. All rights reserved.
//

#import "AppDelegate.h"
#import "PageOneViewController.h"
#import "PageTwoViewController.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

    
    [self setupAppWithURL:url];
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [self setupAppWithURL:url];
    return YES;
}

- (void)setupAppWithURL:(NSURL *)url
{
    
    if (![url.scheme isEqualToString:@"demobscheme"]) {//这里是全部小写
        return;
    }
    
    // 1.获取导航栏控制器
    UINavigationController *rootNav = (UINavigationController *)self.window.rootViewController;
    // 2.获得主控制器
    UIViewController *mainVc = [rootNav.childViewControllers firstObject];
    
    // 3.每次跳转前必须是在跟控制器(细节)
    [rootNav popToRootViewControllerAnimated:NO];
    
    if ([url.absoluteString containsString:@"page1"]) {//与DemoA约定好的字符
        PageOneViewController *page = [[PageOneViewController alloc] init];
        page.urlString = url.absoluteString;
        
        [mainVc.navigationController pushViewController:page animated:YES];
    }
    else if ([url.absoluteString containsString:@"page2"]) {
        PageOneViewController *page = [[PageOneViewController alloc] init];
        page.urlString = url.absoluteString;
        [mainVc.navigationController pushViewController:page animated:YES];
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"打开啦"
                                                            message:[NSString stringWithFormat:@"scheme - %@,\n host -- %@,\n  query -- %@",url.scheme,url.host,url.query]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        NSLog(@"query -- %@", url.query);
        [alertView show];
    }
}

@end
