//
//  UIButton+Extansion.m
//  ExeProject
//
//  Created by qrh on 16/4/27.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "UIButton+Extansion.h"
#import <objc/runtime.h>

static NSString *strKey = @"broadColorKey";

@implementation UIButton (Extansion)

-(void)setBroadColor:(UIColor *)broadColor{
    objc_setAssociatedObject(self, &strKey, broadColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(UIColor *)broadColor{
    return objc_getAssociatedObject(self, &strKey);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%p-----broadColor=%@", self,self.broadColor];
}

@end
