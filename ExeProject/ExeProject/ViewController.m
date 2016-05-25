//
//  ViewController.m
//  ExeProject
//
//  Created by qrh on 16/4/21.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "ViewController.h"
#import "QActivityViewController.h"
#import "QRSATestViewController.h"
#import "QWKWebViewController.h"
#import "Show1ViewController.h"
#import "RuntimeTestController.h"
#import "QMoveTableCellController.h"
#import "CAAnimationController.h"
#import "OCJSViewController.h"
#import "MyInputViewController.h"
#import "TestSplitViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [[NSMutableArray alloc] init];
    [_dataArr addObject:@"QActivityViewController"];
    [_dataArr addObject:@"QRSATestViewController"];
    [_dataArr addObject:@"QWKWebViewController"];
    [_dataArr addObject:@"Show1ViewController"];
    [_dataArr addObject:@"RuntimeTestController"];
    [_dataArr addObject:@"QMoveTableCellController"];
    [_dataArr addObject:@"CAAnimationController"];
    [_dataArr addObject:@"OCJSViewController"];
    [_dataArr addObject:@"MyInputViewController"];
    [_dataArr addObject:@"TestSplitViewController"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"mycellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [_dataArr objectAtIndex:indexPath.section];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id class = NSClassFromString([_dataArr objectAtIndex:indexPath.section]);
    UIViewController *VC = [[class alloc] init];
    
//    VC.providesPresentationContextTransitionStyle = YES;
//    VC.definesPresentationContext = YES;
//    [VC setModalPresentationStyle:UIModalPresentationFormSheet];
    
    [self presentViewController:VC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
