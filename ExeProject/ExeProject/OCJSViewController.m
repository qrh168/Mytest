//
//  OCJSViewController.m
//  ExeProject
//
//  Created by qrh on 16/5/20.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "OCJSViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface OCJSViewController()<UIWebViewDelegate>
{
    UIWebView *myWebView;
}
@end

@implementation OCJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:@"https://baidu.com/"];
    web.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    [self.view addSubview:web];
}

//-(void)viewDidLoad{
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor grayColor];
//    
//    myWebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 22, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-100)];
//    myWebView.delegate=self;
//    //添加webview到当前viewcontroller的view上
//    [self.view addSubview:myWebView];
//    
//    //网址
//    NSString *httpStr=@"https://github.com/";
//    NSURL *httpUrl=[NSURL URLWithString:httpStr];
//    NSURLRequest *httpRequest=[NSURLRequest requestWithURL:httpUrl];
//    [myWebView loadRequest:httpRequest];
//    
//    
//    
//    
//    
//    
//    
//    
//    
////    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 500)];
////    _webView.delegate = self;
////    [self.view addSubview:_webView];
//////    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
////    NSURL *url = [NSURL URLWithString:@"http://baidu.com"];
////    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
//}
//
////-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
////    
////    return YES;
////}
//
//-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    
//    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    context[@"test"]=^(){
//        NSArray *arr = [JSContext currentArguments];
//        for (id objc in arr) {
//            NSLog(@"%@",objc);
//        }
//    };
//}
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

@end
