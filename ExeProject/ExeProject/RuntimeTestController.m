//
//  RuntimeTestController.m
//  ExeProject
//
//  Created by qrh on 16/4/27.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "RuntimeTestController.h"
#import "UIButton+Extansion.h"
#import <objc/runtime.h>

@implementation RuntimeTestController

+(void)load{
    Method uppercaseString = class_getInstanceMethod([NSString class], @selector(uppercaseString));
    Method lowercaseString = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    method_exchangeImplementations(uppercaseString, lowercaseString);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /**
     *  黑魔法
     */
    NSString *testStr = @"Hello World!";
    NSLog(@"转大写==%@",[testStr uppercaseString]);
    NSLog(@"转小写==%@",[testStr lowercaseString]);
    
    /**
     *  给分类添加属性(成员)
     */
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.broadColor = [UIColor redColor];
    button.backgroundColor = button.broadColor;
    NSLog(@"%@",button);
    [self.view addSubview:button];
    
}

/**
 *  动态添加方法
 *
 */
id dynamicMethod(id self, SEL _cmd) {
    NSLog(@"首先尝试动态添加方法");
    return @"首先尝试动态添加方法";
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selectorString = NSStringFromSelector(sel);
    
    if ([selectorString isEqualToString:@"mytest"]) {
        class_addMethod(self, sel, (IMP)dynamicMethod, "@@:");
    }
    
    return YES;
}



@end
