//
//  UIViewController+Keyboard.m
//  LWKeyboard
//
//  Created by liwei on 16/5/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "UIViewController+Keyboard.h"
#import "LWKeyboardBar.h"
#import "LWKeyboardView.h"

@implementation UIViewController (Keyboard)



- (void)setupTextViewKeyboardBar:(BOOL)hidden
{
    NSLog(@"viewDidLoad");
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textViewDidEndEditingNotice:)
                                                 name:UITextViewTextDidBeginEditingNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardBarCloseNotice)
                                                 name:LWKeyboardBarCloseNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardFuncButtonNotice:)
                                                 name:LWKeyboardFuncButtonNotification
                                               object:nil];
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    CGFloat kbh = 36.f;
    CGFloat  kby = [UIScreen mainScreen].bounds.size.height - kbh;
    LWKeyboardBar *keyboardbar = [[LWKeyboardBar alloc] initWithFrame:CGRectMake(0, kby, [UIScreen mainScreen].bounds.size.width, kbh)];
    keyboardbar.hidden = hidden;
    if (hidden) {
        keyboardbar.tag = 100;
    }else {
        keyboardbar.tag = 101;
    }
    [window addSubview:keyboardbar];
}

#pragma mark -  textView resignFirstResponder
- (void)textViewResign
{
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[UITextView class]]) {
            UITextView *textView = (UITextView *)view;
            [textView resignFirstResponder];
        }
    }
}

#pragma mark -  LWKeyboardView removeFromSuperview
- (void)removeCustomKeyboard:(UIWindow *)window
{
    for (UIView *view in [window subviews]) {
        if ([view isKindOfClass:[LWKeyboardView class]]) {
            [view removeFromSuperview];
        }
    }

}

#pragma mark - revmove KeyboardBar
- (void)removeKeyboardBar
{
    [self textViewResign];
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];

    [self removeCustomKeyboard:window];
    
    for (UIView *view in [window subviews]) {
        if ([view isKindOfClass:[LWKeyboardBar class]]) {
            LWKeyboardBar *keyboardBar = (LWKeyboardBar *)view;
            [keyboardBar removeFromSuperview];
        }
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:LWKeyboardBarCloseNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:LWKeyboardFuncButtonNotification object:nil];
}

#pragma mark - notice
- (void)textViewDidEndEditingNotice:(NSNotification *)notice
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardNotice:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
}

- (void)keyboardBarCloseNotice
{
    [self keyboardClosed];
}

- (void)keyboardFuncButtonNotice:(NSNotification *)notice
{
    NSNumber *tagNum = [notice object];
    NSInteger tag = [tagNum integerValue];
    
    
    [self setupKeyboardView:tag];
}

- (void)keyboardNotice:(NSNotification *)notice
{
    //NSLog(@"userInfo: %@", notice.userInfo);
    NSValue *value = notice.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect kbRect = [value CGRectValue];
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    for (UIView *view in [window subviews]) {
        if ([view isKindOfClass:[LWKeyboardBar class]]) {
            LWKeyboardBar *keyboardBar = (LWKeyboardBar *)view;
            keyboardBar.hidden = NO;
            
            CGFloat kbHeight = keyboardBar.frame.size.height;
            
            [UIView animateWithDuration:0.25
                                  delay:0
                 usingSpringWithDamping:2
                  initialSpringVelocity:0
                                options:UIViewAnimationOptionTransitionCurlUp
                             animations:^{
                                 CGRect viewRect = keyboardBar.frame;
                                 viewRect.origin.y = kbRect.origin.y - kbHeight;
                                 keyboardBar.frame = viewRect;
                             } completion:^(BOOL finished) {
                                 
                             }];
        }
    }
}


#pragma mark - touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   [self keyboardClosed];
}

#pragma mark - custom
- (void)keyboardClosed
{
    [self textViewResign];
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [self removeCustomKeyboard:window];

    
    for (UIView *view in [window subviews]) {
        if ([view isKindOfClass:[LWKeyboardBar class]]) {
            LWKeyboardBar *keyboardBar = (LWKeyboardBar *)view;
            CGFloat kbY = [UIScreen mainScreen].bounds.size.height - keyboardBar.frame.size.height;
            [UIView animateWithDuration:0.25
                                  delay:0
                 usingSpringWithDamping:1
                  initialSpringVelocity:0
                                options:UIViewAnimationOptionTransitionCurlDown
                             animations:^{
                                 CGRect viewRect = keyboardBar.frame;
                                 viewRect.origin.y = kbY;
                                 keyboardBar.frame = viewRect;
                             } completion:^(BOOL finished) {
                                 if (keyboardBar.tag == 100) {
                                     keyboardBar.hidden = YES;
                                 }else {
                                     keyboardBar.hidden = NO;
                                 }
                             }];
        }
    }
}

- (void)setupKeyboardView:(NSInteger)tag
{
    [self textViewResign];
    
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];

    [self removeCustomKeyboard:window];

    
    UIColor *bgColor = nil;
    if (tag%2 == 0) {
        bgColor = [UIColor orangeColor];
    }else {
        bgColor = [UIColor darkGrayColor];
    }
    
    
    CGFloat kbViewHeight = 216.f;
    CGFloat  kbViewY = [UIScreen mainScreen].bounds.size.height - kbViewHeight;
    
    for (UIView *view in [window subviews]) {
        
        if ([view isKindOfClass:[LWKeyboardBar class]]) {
            LWKeyboardBar *keyboardBar = (LWKeyboardBar *)view;
            keyboardBar.hidden = NO;
            
            CGFloat kbHeight = keyboardBar.frame.size.height;
            
            [UIView animateWithDuration:0.25
                                  delay:0
                 usingSpringWithDamping:2
                  initialSpringVelocity:0
                                options:UIViewAnimationOptionTransitionCurlDown
                             animations:^{
                                 CGRect viewRect = keyboardBar.frame;
                                 viewRect.origin.y = kbViewY - kbHeight;
                                 keyboardBar.frame = viewRect;
                             } completion:^(BOOL finished) {
                                 
                             }];
        }
    }
    
    LWKeyboardView *keyboardView = [[LWKeyboardView alloc] initWithFrame:CGRectMake(0, kbViewY, [UIScreen mainScreen].bounds.size.width, kbViewHeight)];
    keyboardView.backgroundColor = bgColor;
    [window addSubview:keyboardView];
    
    if (tag == 5) {
        [keyboardView setupTextSetView];
    }

}

@end
