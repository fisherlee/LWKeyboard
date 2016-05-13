//
//  LWKeyboardView.m
//  LWKeyboard
//
//  Created by liwei on 16/5/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "LWKeyboardView.h"

@implementation LWKeyboardView

- (void)setupTextSetView
{
    CGSize btnSize = CGSizeMake(50, 80);
    
    
    NSArray *btnArray = @[@{@"字体":@"a"}, @{@"斜体":@"i"}, @{@"下划线":@"u"}];
    
    
    UIButton *btn = nil;
    for (NSInteger i = 0; i < [btnArray count]; i++) {
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(5.f + 10.f * i + i * btnSize.width, 5.f, btnSize.width, btnSize.height);
        
        [self addSubview:btn];
        
        NSDictionary *dict = btnArray[i];
        NSArray *keyArr = [dict allKeys];
        NSArray *valueArr = [dict allValues];
        
        UIImageView *iconImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:valueArr[0]]];
        iconImg.frame = CGRectMake(0, 0, btnSize.width, btnSize.width);
        iconImg.backgroundColor = [UIColor clearColor];
        iconImg.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        iconImg.layer.borderWidth = 1.f;
        iconImg.layer.cornerRadius = 5.f;
        [btn addSubview:iconImg];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, btnSize.width, btnSize.width, btnSize.height - btnSize.width)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.font = [UIFont systemFontOfSize:14.f];
        titleLabel.textColor = [UIColor lightGrayColor];
        titleLabel.text = keyArr[0];
        [btn addSubview:titleLabel];
    }
}

@end
