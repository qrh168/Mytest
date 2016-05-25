//
//  Show1ViewController.m
//  ExeProject
//
//  Created by qrh on 16/4/27.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "Show1ViewController.h"
#import "UIImage+ImageEffects.h"

@interface Show1ViewController ()
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation Show1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _imageView = [[UIImageView alloc] init];//
//    _imageView.frame = (CGRect){self.view.center, CGSizeMake(100, 100)};
//    [self.view addSubview:_imageView];
    
    // 获取显示图片
    UIImage *showImage = [UIImage imageNamed:@"mzIcon"];
    // 显示的图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){CGPointZero, showImage.size}];
    imageView.image        = showImage;
    imageView.center       = self.view.center;
    [self.view addSubview:imageView];
    
    // 获取遮罩图片
    UIImage *maskImage = [UIImage imageNamed:@"mask"];

    // 带透明像素PNG图片
    UIImage *png = [maskImage blurImageWithRadius:20];
    
    // 将透明像素PNG图片转换为遮罩用mask
    CALayer *maskLayer = [CALayer layer];
    maskLayer.contents = (__bridge id)(png.CGImage);
    maskLayer.frame    = (CGRect){CGPointZero, showImage.size};
    
    // 使用遮罩mask
    CALayer *showLayer = [CALayer layer];
    showLayer.frame    = (CGRect){CGPointZero, showImage.size};
    showLayer.mask     = maskLayer;
    showLayer.backgroundColor = [showImage averageColor].CGColor; // 取图片平均颜色
    showLayer.position = self.view.center;
    
    // 设置背景色
    self.view.backgroundColor = [showImage averageColor];         // 取图片平均颜色
    [self.view.layer addSublayer:showLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
