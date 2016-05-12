//
//  LWKeyboardView.m
//  LWKeyboard
//
//  Created by liwei on 16/5/11.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "LWKeyboardBar.h"

NSString * const LWKeyboardBarCloseNotification = @"LWKeyboardBarCloseNotification";
NSString * const LWKeyboardFuncButtonNotification = @"LWKeyboardFuncButtonNotification";


@implementation LWKeyboardBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:238.f/255.f green:238.f/255.f blue:240.f/255.f alpha:1.f];

        
        UIView *topHline = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1.f)];
        topHline.backgroundColor = [UIColor colorWithRed:220.f/255.f green:220.f/255.f blue:222.f/255.f alpha:1.f];
        [self addSubview:topHline];
        
        UIView *bottomHline = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1.f, self.frame.size.width, 1.f)];
        bottomHline.backgroundColor = [UIColor colorWithRed:220.f/255.f green:220.f/255.f blue:222.f/255.f alpha:1.f];
        [self addSubview:bottomHline];
        
        CGFloat space = 5.f;
        CGSize btnSize = CGSizeMake(self.frame.size.height-space, self.frame.size.height-space);
        CGFloat pbx = self.frame.size.width-btnSize.width-space;
        CGFloat pby = space/2;
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(pbx, pby, btnSize.width, btnSize.height);
        closeBtn.tintColor = [UIColor darkGrayColor];
        [closeBtn setImage:[UIImage imageNamed:@"keyboard_close_icon"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeBtn];
        
//        closeBtn.transform = CGAffineTransformMakeRotation(120);
        
        UIScrollView *funcScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, pbx, self.frame.size.height)];
        funcScrollView.backgroundColor = [UIColor clearColor];
        [self addSubview:funcScrollView];
        
        NSArray *funcBtnArray = @[@"d", @"e", @"f", @"g", @"b", @"w", @"c", @"b", @"w"];
        CGFloat funcBtnWidth = btnSize.width + 10.f;
        
        [funcScrollView setContentSize:CGSizeMake(funcBtnArray.count * funcBtnWidth, self.frame.size.height)];
        
        UIButton *funcBtn = nil;
        for (NSInteger i = 0; i < [funcBtnArray count]; i++) {
            funcBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            funcBtn.frame = CGRectMake(5.f + 10.f * i + i * btnSize.width, pby, btnSize.width, btnSize.height);
            [funcBtn setImage:[UIImage imageNamed:funcBtnArray[i]] forState:UIControlStateNormal];
            funcBtn.tag = i;
            [funcBtn addTarget:self action:@selector(funcBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [funcScrollView addSubview:funcBtn];
        }
    }
    return self;
}

- (void)closeBtnAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:LWKeyboardBarCloseNotification object:nil];
}

- (void)funcBtnAction:(id)sender
{
    NSNumber *tag = [NSNumber numberWithInteger:[sender tag]];
    [[NSNotificationCenter defaultCenter] postNotificationName:LWKeyboardFuncButtonNotification object:tag];
}

@end
