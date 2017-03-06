//
//  ViewController.m
//  06-OC调用HTML
//
//  Created by xiaomage on 15/11/3.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, weak) UIActivityIndicatorView *showView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.webView.scrollView.hidden = YES;
    self.webView.backgroundColor = [UIColor grayColor];
  
    // 加载网页
    NSURL *url = [NSURL URLWithString:@"http://www.xianhua.cn/m/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    UIActivityIndicatorView *showView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [showView startAnimating];
    self.showView = showView;
    showView.center = self.view.center;
    [self.webView addSubview:showView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    // 删除
    NSString *str = @"document.getElementsByClassName('detail_btns2')[0].remove();";
    [webView stringByEvaluatingJavaScriptFromString:str];
    
    // 改变头部
    NSString *str1 = @"document.getElementsByTagName('h1')[0].innerText = '大神5期鲜花网';";
    [webView stringByEvaluatingJavaScriptFromString:str1];
    
    // 改变底部
    NSString *str2 = @"document.getElementById('xiazaiapp').getElementsByTagName('a')[0].innerText = '下载大神5期app';";
    [webView stringByEvaluatingJavaScriptFromString:str2];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.showView stopAnimating];
        self.webView.scrollView.hidden = NO;
    });
}

@end
