//
//  MyInputView.m
//  ExeProject
//
//  Created by qrh on 16/5/23.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "MyInputView.h"

#define InputW [UIScreen mainScreen].bounds.size.width
#define InputH 216 //高度

//static MyInputView *_inputView = nil;
//
//@interface MyInputView()
//
//@end
//
@implementation MyInputView
//
//+(instancetype)shareInstance{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _inputView = [[self hiddenAlloc] init];
//    });
//    return _inputView;
//}
//+ (instancetype)hiddenAlloc
//{
//    return [super alloc];
//}
//+ (instancetype)alloc
//{
//    NSAssert(NO, @"请使用shareInstance方法");
//    return nil;
//}
//+ (instancetype)new
//{
//    return [self alloc];
//}

-(instancetype)init{
    self = [super init];
    if(self){
        self.frame = CGRectMake(0, 0, InputW, InputH);
        [self createInputView];
    }
    return self;
}

-(void)createInputView{
//    if(){
//        
//    }
    CGFloat btnW = InputW/3;
    CGFloat btnH = InputH/4;
    CGFloat btnY = 0;//按钮的Y值
    CGFloat btnX = 0;//按钮的X值
    for (int i = 1; i<=12; i++) {
        btnX = btnW * (i%3==0?(2):(i%3-1));
        if((i-1)%3 == 0 && i>1){
            btnY += btnH;
        }
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        if(i==10){
            [btn setTitle:@"abc" forState:UIControlStateNormal];
        }else if(i==11){
            [btn setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        }else if(i==12){
            [btn setTitle:[NSString stringWithFormat:@"%@",@"撤销"] forState:UIControlStateNormal];
        }else{
            [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        }
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = [UIColor grayColor].CGColor;
        btn.tag = i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

-(void)btnAction:(UIButton *)btn{
    NSLog(@"%ld",btn.tag);
}

@end
