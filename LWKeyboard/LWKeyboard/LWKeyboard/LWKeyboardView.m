//
//  LWKeyboardView.m
//  LWKeyboard
//
//  Created by liwei on 16/5/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "LWKeyboardView.h"

@implementation LWKeyboardView

- (void)setupCamera
{
    NSArray *btnArray = @[@{@"相机":@"camera_icon"}, @{@"相册":@"pictures_icon"}];
    [self displayButtonView:btnArray];
}

- (void)setupImagesView
{
    self.backgroundColor = [UIColor colorWithRed:244.f/255.f green:245.f/255.f blue:249.f/255.f alpha:1.f];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:scrollView];
    
    CGSize imgSize = CGSizeMake((self.frame.size.height - 10.f)*0.6, self.frame.size.height - 10.f);
    
    NSMutableArray *marr = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<15; i++) {
        if (i<10) {
           [marr addObject:[NSString stringWithFormat:@"10%@.jpg",@(i)]];
        }else {
            [marr addObject:[NSString stringWithFormat:@"1%@.jpg",@(i)]];
        }
    }
    NSArray *imgArr = [NSArray arrayWithArray:marr];

    [scrollView setContentSize:CGSizeMake((imgSize.width+6.f)*imgArr.count, self.frame.size.height)];
    
    UIImageView *imageView = nil;
    for (NSInteger i = 0; i < imgArr.count; i++) {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgArr[i]]];
        imageView.frame = CGRectMake(5.f+5.f*i+i*imgSize.width, 5.f, imgSize.width, imgSize.height);
        [scrollView addSubview:imageView];
    }
}

- (void)setupTextSetView
{
    NSArray *btnArray = @[@{@"字体":@"a"}, @{@"斜体":@"i"}, @{@"下划线":@"u"}];
    [self displayButtonView:btnArray];
}

#pragma mark --- custom
- (void)displayButtonView:(NSArray *)btnArray
{
    self.backgroundColor = [UIColor colorWithRed:244.f/255.f green:245.f/255.f blue:249.f/255.f alpha:1.f];
    
    CGSize btnSize = CGSizeMake(50, 80);
    
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
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.text = keyArr[0];
        [btn addSubview:titleLabel];
    }

}

@end
