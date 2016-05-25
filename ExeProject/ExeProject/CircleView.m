//
//  CircleView.m
//  ExeProject
//
//  Created by qrh on 16/5/25.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.width/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    path.lineWidth = 2;
    
    UIImage *image = [UIImage imageNamed:@"QR"];
    [image drawInRect:rect];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (CGFloat cr = rect.size.width/2; cr >= 0; cr -= 10) {
        [path moveToPoint:CGPointMake(rect.size.height/2 + cr, rect.size.height/2)];
        [path addArcWithCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:cr startAngle:0 endAngle:M_PI*2 clockwise:YES];
    }
    [[UIColor redColor] setStroke];
    [path stroke];
}


@end
