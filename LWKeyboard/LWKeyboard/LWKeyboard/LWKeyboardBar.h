//
//  LWKeyboardView.h
//  LWKeyboard
//
//  Created by liwei on 16/5/11.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const LWKeyboardBarCloseNotification;
extern NSString * const LWKeyboardFuncButtonNotification;

@interface LWKeyboardBar : UIView

@property (nonatomic, assign) CGFloat *keyboardHeight;

@end
