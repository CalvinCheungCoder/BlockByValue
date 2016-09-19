//
//  SecViewController.m
//  KVOByValue
//
//  Created by 张丁豪 on 16/9/19.
//  Copyright © 2016年 张丁豪. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width - 100, 40)];
    self.textField.layer.cornerRadius = 6;
    self.textField.tag = 100;
    self.textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    
    // 轻扫空白处键盘回收
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    // 轻扫方向, 向下轻扫
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipe];
    
    // 点击空白处键盘回收
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 400, [UIScreen mainScreen].bounds.size.width - 100, 46)];
    [btn setTitle:@"Back" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    btn.layer.cornerRadius = 6;
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

// 方法的实现
- (void)tap:(UITapGestureRecognizer *)tap
{
    // 根据Tag值,获取textField
    UITextField *textField = (UITextField *)[self.view viewWithTag:100];
    
    [textField resignFirstResponder];
    
}

- (void)swipe:(UISwipeGestureRecognizer *)swipe
{
    
    // 根据Tag值,获取textField
    UITextField *textField = (UITextField *)[self.view viewWithTag:100];
    
    [textField resignFirstResponder];
    
}

-(void)btnClicked{
    
    self.myBlock(self.textField.text);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



@end
