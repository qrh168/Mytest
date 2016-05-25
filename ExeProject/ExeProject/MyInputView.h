//
//  MyInputView.h
//  ExeProject
//
//  Created by qrh on 16/5/23.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    MyInputViewTypeNumber,
    MyInputViewTypeABC
} MyInputViewType;

@interface MyInputView : UIView

+(instancetype)shareInstance;

@end
