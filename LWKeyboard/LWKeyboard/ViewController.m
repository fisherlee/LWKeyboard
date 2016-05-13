//
//  ViewController.m
//  LWKeyboard
//
//  Created by liwei on 16/5/11.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Keyboard.h"

#import "TextViewDemoViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) TextViewDemoViewController *demoController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"有bar" style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnItemAction)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    
    
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(20.f, 70.f, width - 40.f, 100.f)];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _textView.layer.borderWidth = 1.f;
    _textView.layer.cornerRadius = 5.f;
    [self.view addSubview:_textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self setupTextViewKeyboardBar:YES];
    
    _demoController = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    [self removeKeyboardBar];
}

- (void)rightBtnItemAction
{
    if (_demoController == nil) {
        _demoController = [[TextViewDemoViewController alloc] init];
        [self.navigationController pushViewController:_demoController animated:YES];
    }
}



@end
