//
//  QActivityViewController.m
//  ExeProject
//
//  Created by qrh on 16/4/21.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "QActivityViewController.h"

@interface QActivityViewController ()

@end

@implementation QActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
//    [self.view.backgroundColor colorWithAlphaComponent:0.5];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    button.center = self.view.center;
    [button setTitle:@"share" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showAC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)showAC{
    NSString *textToShare = @"要分享的文本内容";
    UIImage *imageToShare = [UIImage imageNamed:@"mzIcon"];
    NSURL *urlToShare = [NSURL URLWithString:@"http://mzmoney.com"];
    NSArray *activityItems = @[textToShare, imageToShare, urlToShare];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
#if isiPad
    UIPopoverController *popController = [[UIPopoverController alloc] initWithContentViewController:activityVC];
    popController.popoverContentSize = CGSizeMake(500,500);
    [popController presentPopoverFromRect:CGRectMake(0, 400, 500, 500) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
#else
    [self presentViewController:activityVC animated:YES completion:^{
        
    }];
#endif
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
