//
//  TextViewDemoViewController.m
//  LWKeyboard
//
//  Created by liwei on 16/5/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "TextViewDemoViewController.h"
#import "UIViewController+Keyboard.h"

@interface TextViewDemoViewController ()


@property (nonatomic, strong) UITextView *textView;


@end

@implementation TextViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(20.f, 70.f, width - 40.f, 100.f)];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _textView.layer.borderWidth = 1.f;
    _textView.layer.cornerRadius = 5.f;
    [self.view addSubview:_textView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self setupTextViewKeyboardBar:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    [self removeKeyboardBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

@end
