//
//  ViewController.m
//  07-HTML中调用OC
//
//  Created by xiaomage on 15/11/3.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];

}


#pragma - UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    NSLog(@"%@", request.URL.absoluteString);
    NSString *str = request.URL.absoluteString;
    NSRange range = [str rangeOfString:@"ds5q:///"];
    NSUInteger location = range.location;
    if (location != NSNotFound) {
        NSString *str2 = [str substringFromIndex:location + range.length];
        SEL sel = NSSelectorFromString(str2);
        [self performSelector:sel];
    }
    
    return YES;
}

// 访问相册
- (void)openCamera{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

@end
