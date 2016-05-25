//
//  TestSplitViewController.m
//  ExeProject
//
//  Created by qrh on 16/5/24.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "TestSplitViewController.h"
#import "MainViewController.h"
#import "SubViewController.h"

@interface TestSplitViewController ()
@property (nonatomic,strong) UISplitViewController *splitVC;
@end

@implementation TestSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.splitVC = [[UISplitViewController alloc] init];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    
    SubViewController *subVC = [[SubViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:subVC];
    mainVC.subVC = subVC;
    self.splitVC.delegate = subVC;
    self.splitVC.viewControllers = @[nav1, nav2];
    [self addChildViewController:self.splitVC];
    self.splitVC.view.frame = self.view.bounds;
    [self.view addSubview:self.splitVC.view];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
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
