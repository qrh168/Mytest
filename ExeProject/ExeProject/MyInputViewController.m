//
//  MyInputViewController.m
//  ExeProject
//
//  Created by qrh on 16/5/23.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "MyInputViewController.h"
#import "MyInputView.h"

@interface MyInputViewController ()
@property (nonatomic,strong) UITextField *usernameF;
@property (nonatomic,strong) UITextField *passwordF;
@property (nonatomic,strong) MyInputView *inputView;
@end

@implementation MyInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _inputView = [[MyInputView alloc] init];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 50, 25)];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setBackgroundColor:[UIColor redColor]];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    _usernameF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    _usernameF.center = CGPointMake(self.view.center.x, 200);
    _usernameF.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_usernameF];
    
    _passwordF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    _passwordF.center = CGPointMake(self.view.center.x, 250);
    _passwordF.borderStyle = UITextBorderStyleRoundedRect;
    _passwordF.secureTextEntry = YES;
    [self.view addSubview:_passwordF];
    
    _usernameF.inputView = _inputView;
    _passwordF.inputView = _inputView;
    
    UIView *testV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    testV.backgroundColor = [UIColor redColor];
    _usernameF.inputAccessoryView = testV;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_usernameF resignFirstResponder];
    [_passwordF resignFirstResponder];
}

-(void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
