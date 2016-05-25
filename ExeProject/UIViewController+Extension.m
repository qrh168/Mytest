//
//  UIViewController+Extension.m
//  ExeProject
//
//  Created by qrh on 16/4/27.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
