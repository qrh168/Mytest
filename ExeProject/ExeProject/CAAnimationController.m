//
//  CAAnimationController.m
//  ExeProject
//
//  Created by qrh on 16/4/28.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "CAAnimationController.h"
#import "CircleView.h"
@interface CAAnimationController(){
    UIView *_baseAnimationView;
}
@end

@implementation CAAnimationController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //CAAnimation - CATransaction/CAAnimationGroup/CAPropertyAnimation
    //CAPropertyAnimation - CABasicAnimation/CASpringAnimation(ios9以后)/CAKeyframeAnimation
    
    _baseAnimationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _baseAnimationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_baseAnimationView];
    //基础动画
    [self testCABaseAnimation];
    
    //帧动画
    [self testCAkeyframeAnimation];
    
    //组动画
    [self testCAGroupAnimation];
    
    //圆形
    CircleView *cv = [[CircleView alloc] initWithFrame:CGRectMake(100, 120, 200, 200)];
    [self.view addSubview:cv];
    
    
}

-(void)testCABaseAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @0.1;
    animation.toValue = @1.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 2.f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBackwards;
    [_baseAnimationView.layer addAnimation:animation forKey:nil];
}

-(void)testCAkeyframeAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 2.f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBackwards;
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(50, 400)];
    animation.values = @[value1,value2,value3,value4,value5];
    
    [_baseAnimationView.layer addAnimation:animation forKey:nil];
}
-(void)testCAGroupAnimation{
    
}

@end
