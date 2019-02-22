//
//  ViewController.m
//  DemoB
//
//  Created by yons on 17/2/20.
//  Copyright © 2017年 yons. All rights reserved.
//

#import "ViewController.h"
#import "PageOneViewController.h"
@interface ViewController ()
- (IBAction)pageOne:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.title = @"DemoB";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pageOne:(id)sender {
    PageOneViewController *page = [[PageOneViewController alloc] init];
    [self.navigationController pushViewController:page animated:YES];
}
@end
