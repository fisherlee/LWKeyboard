//
//  LWKeyboardView.m
//  LWKeyboard
//
//  Created by liwei on 16/5/11.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "LWKeyboardView.h"

@implementation LWKeyboardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *topHline = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1.f)];
        topHline.backgroundColor = [UIColor colorWithRed:220.f/255.f green:220.f/255.f blue:222.f/255.f alpha:1.f];
        [self addSubview:topHline];
        
        UIView *bottomHline = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1.f, self.frame.size.width, 1.f)];
        bottomHline.backgroundColor = [UIColor colorWithRed:220.f/255.f green:220.f/255.f blue:222.f/255.f alpha:1.f];
        [self addSubview:bottomHline];
        
        CGFloat space = 10.f;
        CGSize btnSize = CGSizeMake(self.frame.size.height-10.f, self.frame.size.height-space);
        CGFloat pbx = self.frame.size.width-btnSize.width-10.f;
        CGFloat pby = space/2;
        UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        plusBtn.frame = CGRectMake(pbx, pby, btnSize.width, btnSize.height);
        plusBtn.tintColor = [UIColor darkGrayColor];
        [self addSubview:plusBtn];
        
        UIScrollView *funcScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, pbx, self.frame.size.height)];
        funcScrollView.backgroundColor = [UIColor clearColor];
        [self addSubview:funcScrollView];
        
        NSArray *funcBtnArray = @[@"a", @"i", @"u", @"c", @"b", @"w", @"i", @"u", @"c", @"b", @"w"];
        CGFloat funcBtnWidth = btnSize.width + 10.f;
        
        [funcScrollView setContentSize:CGSizeMake(funcBtnArray.count * funcBtnWidth, self.frame.size.height)];
        
        UIButton *funcBtn = nil;
        for (NSInteger i = 0; i < [funcBtnArray count]; i++) {
            funcBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            funcBtn.frame = CGRectMake(10.f * (i+1) + i * btnSize.width, pby, btnSize.width, btnSize.height);
            [funcBtn setImage:[UIImage imageNamed:funcBtnArray[i]] forState:UIControlStateNormal];
            [funcScrollView addSubview:funcBtn];
        }
    }
    return self;
}

@end
