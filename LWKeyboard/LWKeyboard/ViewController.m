//
//  ViewController.m
//  LWKeyboard
//
//  Created by liwei on 16/5/11.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "ViewController.h"
#import "LWKeyboardView.h"

@interface ViewController ()<UITextViewDelegate>
{
    CGFloat kbh;
    CGFloat kby;
}
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) LWKeyboardView *keyboardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(20.f, 70.f, width - 40.f, 100.f)];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.delegate = self;
    _textView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _textView.layer.borderWidth = 1.f;
    _textView.layer.cornerRadius = 5.f;
    [self.view addSubview:_textView];
    
    kbh = 36.f;
    kby = height - kbh;
    _keyboardView = [[LWKeyboardView alloc] initWithFrame:CGRectMake(0, kby, width, kbh)
                                              funcIconArr:nil];
    [self.view addSubview:_keyboardView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardNotice:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
}

#pragma mark - notice
- (void)keyboardNotice:(NSNotification *)notice
{
    NSLog(@"userInfo: %@", notice.userInfo);
    NSValue *value = notice.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect kbRect = [value CGRectValue];
    
    [UIView animateWithDuration:0.25
                          delay:0
         usingSpringWithDamping:2
          initialSpringVelocity:0
                        options:UIViewAnimationOptionTransitionCurlUp
                     animations:^{
                         CGRect viewRect = _keyboardView.frame;
                         viewRect.origin.y = kbRect.origin.y - kbh;
                         _keyboardView.frame = viewRect;
                     } completion:^(BOOL finished) {
                         
                     }];
    
}

#pragma mark - touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_textView resignFirstResponder];
    
    [UIView animateWithDuration:0.25
                          delay:0
         usingSpringWithDamping:1
          initialSpringVelocity:0
                        options:UIViewAnimationOptionTransitionCurlDown
                     animations:^{
                         CGRect viewRect = _keyboardView.frame;
                         viewRect.origin.y = kby;
                         _keyboardView.frame = viewRect;
                     } completion:^(BOOL finished) {
                         
                     }];
}


@end
