//
//  QMoveTableCellController.m
//  ExeProject
//
//  Created by qrh on 16/5/19.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "QMoveTableCellController.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width

@implementation QMoveTableCellController

-(void)viewDidLoad{
    [super viewDidLoad];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"mycellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0f green:arc4random_uniform(255)/255.0f blue:arc4random_uniform(255)/255.0f alpha:1];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.alpha = 0.5;
    
//    CGAffineTransform transformScale = CGAffineTransformMakeScale(0.3,0.8);
//    CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0.5, 0.6);

//    cell.transform = CGAffineTransformConcat(transformScale, transformTranslate);
    cell.transform = CGAffineTransformTranslate(cell.transform, ScreenW/2, 0);
    
    [tableView bringSubviewToFront:cell];
//    [tableView sendSubviewToBack:cell];
    [UIView animateWithDuration:.5f
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.alpha = 1;
                         //清空 transform
                         cell.transform = CGAffineTransformIdentity;
                         
                     } completion:nil];
}

@end
