//
//  SubViewController.m
//  ExeProject
//
//  Created by qrh on 16/5/24.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    if (self.splitViewController.displayMode == UISplitViewControllerDisplayModePrimaryHidden){
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Course" style:self.splitViewController.displayModeButtonItem.style target:self.splitViewController.displayModeButtonItem.target action:self.splitViewController.displayModeButtonItem.action];
    }
#endif
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0

-(void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
//    UISplitViewControllerDisplayModeAutomatic,
//    UISplitViewControllerDisplayModePrimaryHidden,//消失的时候
//    UISplitViewControllerDisplayModeAllVisible,//旋转后可见
//    UISplitViewControllerDisplayModePrimaryOverlay //覆盖的时候
    
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Course" style:svc.displayModeButtonItem.style target:svc.displayModeButtonItem.target action:svc.displayModeButtonItem.action];
    }else{
        self.navigationItem.leftBarButtonItem = nil;
    }
}

-(BOOL)splitViewController:(UISplitViewController *)splitViewController showViewController:(UIViewController *)vc sender:(id)sender{
    return YES;
}
#else

- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    // If this bar button item does not have a title, it will not appear at all
    barButtonItem.title = @"Courses";
    
    // Take this bar button item and put it on the left side of the nav item
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Remove the bar button item from the navigation item
    // Double check that it is the correct button, even though we know it is
    if (barButtonItem == self.navigationItem.leftBarButtonItem) {
        self.navigationItem.leftBarButtonItem = nil;
    }
}

#endif

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
