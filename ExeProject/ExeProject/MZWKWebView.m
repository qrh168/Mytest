////
////  MZWKWebView.m
////  MZMoney-iPad
////
////  Created by qrh on 16/4/22.
////  Copyright © 2016年 com.mzmoney. All rights reserved.
////
//
//#import "MZWKWebView.h"
//#import "MZMoreConsultViewController.h"
//#import "MZPhotoViewController.h"
//
//@interface MZWKWebView()<WKNavigationDelegate,NSURLConnectionDelegate>
//{
//    NSURLRequest *originRequest;
//    BOOL authed;
//}
//@end
//
//@implementation MZWKWebView
//
//-(instancetype)initWithUrl:(NSString *)url
//{
//    self = [super init];
//    if (self) {
//        self.backgroundColor = ViewBackGroundColor;
//        [self initDefaultWithUrl:url];
//    }
//    return self;
//}
//
//-(void)initDefaultWithUrl:(NSString *)url{
//    
//    self.scrollView.showsVerticalScrollIndicator = NO;
//    
//    _bridge = [WKWebViewJavascriptBridge bridgeForWebView:self];
//    
//    [_bridge registerHandler:@"ObjcCallBackJs" handler:^(id data, WVJBResponseCallback responseCallback) {
//        NSString *jsonStr = data;
//        NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
//        NSError *err=nil;
//        NSDictionary *dictImgs = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
//        if (!err) {
//            MZPhotoViewController *photot = [[MZPhotoViewController alloc]init];
//            photot.urls = [dictImgs objectForKey:@"pics"];
//            photot.strTitle = [dictImgs objectForKey:@"title"];
//            UIViewController *control = [self viewController];
//            [control.navigationController pushViewController:photot animated:YES];
//        }
//    }];
//    
//    [_bridge setWebViewDelegate:self];
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
//    [self loadRequest:request];
//    //[self setScalesPageToFit:YES];
//}
//
//-(WKWebViewJavascriptBridge *)bridge{
//    return _bridge;
//}
//
//#pragma mark =========  WebViewDelegate
//
////-(void)webViewDidStartLoad:(UIWebView *)webView
////{
////    [MBProgressHUD showGIFInView:self];
////}
//
//-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
//    [MBProgressHUD showGIFInView:self];
//}
////====================================================
////- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
////{
////    [MBProgressHUD hideHUDForView:self animated:YES];
////}
//
//-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
//    [MBProgressHUD hideHUDForView:self animated:YES];
//}
////====================================================
////- (void)webViewDidFinishLoad:(UIWebView *)webView
////{
////    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
////    UIViewController *control = [self viewController];
////    if (title.length>0 && control.title.length == 0) {
////        control.title = title;
////    }
////    [MZTool changeWebViewJs:webView];
////    [MBProgressHUD hideHUDForView:self animated:YES];
////}
//
//-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//    if (webView.title.length>0) {
//        UIViewController *control = [self viewController];
//        if (control.title.length == 0) {
//            control.title = webView.title;
//        }
//    }
//    [MZTool changeWKWebViewJs:webView];
//    [MBProgressHUD hideHUDForView:self animated:YES];
//}
//
////====================================================
//- (BOOL)webView:(UIWebView *)awebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
//{
//    NSString* scheme = [[request URL] scheme];
//    //判断是不是https
//    if ([scheme isEqualToString:@"https"]) {
//        //如果是https:的话，那么就用NSURLConnection来重发请求。从而在请求的过程当中吧要请求的URL做信任处理。
//        if (!authed) {
//            originRequest = request;
//            NSURLConnection* conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//            [conn start];
//            [awebView stopLoading];
//            return NO;
//        }
//    }
//    //判断是否是单击
//    if (navigationType == UIWebViewNavigationTypeLinkClicked)
//    {
//        //      NSLog(@"url:%@",request.URL);
//        MZMoreConsultViewController *mcVC = [[MZMoreConsultViewController alloc]init];
//        mcVC.thisURL = [NSString stringWithFormat:@"%@",request.URL];
//        UIViewController *control = [self viewController];
//        [control.navigationController pushViewController:mcVC animated:YES];
//        return NO;
//    }
//    return YES;
//}
//
//
//
//-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
//    NSString* scheme = [[navigationAction.request URL] scheme];
//    //判断是不是https
//    if ([scheme isEqualToString:@"https"]) {
//        //如果是https:的话，那么就用NSURLConnection来重发请求。从而在请求的过程当中吧要请求的URL做信任处理。
//        if (!authed) {
//            originRequest = navigationAction.request;
//            NSURLConnection* conn = [[NSURLConnection alloc] initWithRequest:navigationAction.request delegate:self];
//            [conn start];
//            [webView stopLoading];
//            decisionHandler(WKNavigationActionPolicyAllow);
//        }
//    }
////    //判断是否是单击
////    if (navigationType == UIWebViewNavigationTypeLinkClicked)
////    {
////        //      NSLog(@"url:%@",request.URL);
////        MZMoreConsultViewController *mcVC = [[MZMoreConsultViewController alloc]init];
////        mcVC.thisURL = [NSString stringWithFormat:@"%@",request.URL];
////        UIViewController *control = [self viewController];
////        [control.navigationController pushViewController:mcVC animated:YES];
////        return NO;
////    }
////    return YES;
//    
// 
////    NSString *urlString = [[navigationAction.request URL] absoluteString];
////    
////    urlString = [urlString stringByRemovingPercentEncoding];
////        NSLog(@"urlString=%@",urlString);
////    // 用://截取字符串
////    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
////    if ([urlComps count]) {
////        // 获取协议头
////        NSString *protocolHead = [urlComps objectAtIndex:0];
////        NSLog(@"protocolHead=%@",protocolHead);
////    }
////    decisionHandler(WKNavigationActionPolicyAllow);
//}
//
//- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
//{
//    
//    if ([challenge previousFailureCount]== 0) {
//        authed = YES;
//        //NSURLCredential 这个类是表示身份验证凭据不可变对象。凭证的实际类型声明的类的构造函数来确定。
//        NSURLCredential* cre = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//        [challenge.sender useCredential:cre forAuthenticationChallenge:challenge];
//    }
//    else
//    {
//        [challenge.sender cancelAuthenticationChallenge:challenge];
//    }
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    authed = YES;
//    //webview 重新加载请求。
//    [self loadRequest:originRequest];
//    [connection cancel];
//}
//
///**
// *  获取当前view的父控制器
// */
//- (UIViewController*)viewController {
//    for (UIView* next = [self superview]; next; next = next.superview) {
//        UIResponder* nextResponder = [next nextResponder];
//        if ([nextResponder isKindOfClass:[MZBaseViewController class]]) {
//            return (MZBaseViewController*)nextResponder;
//        }
//    }
//    return nil;
//}
//
//-(void)dealloc{
//    [[NSURLCache  sharedURLCache] removeAllCachedResponses];
//}
//
//@end
