//
//  ViewController.m
//  04-在模拟器中运行登陆界面
//
//  Created by xiaomage on 15/10/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL fileURLWithPath:@"/Users/xiaomage/Desktop/课堂共享/06-HTML5/day2/代码/03-登录界面/index.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
