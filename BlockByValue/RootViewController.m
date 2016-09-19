//
//  RootViewController.m
//  KVOByValue
//
//  Created by 张丁豪 on 16/9/19.
//  Copyright © 2016年 张丁豪. All rights reserved.
//

#import "RootViewController.h"
#import "SecViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    self.title = @"BlockByValue";
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(50, 180, [UIScreen mainScreen].bounds.size.width - 100, 46)];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.textColor = [UIColor redColor];
    [self.view addSubview:self.label];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 400, [UIScreen mainScreen].bounds.size.width - 100, 46)];
    [btn setTitle:@"BlockByValue" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    btn.layer.cornerRadius = 6;
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClicked{
    
    SecViewController *sec = [[SecViewController alloc]init];
    
    //弱引用转换,为了防止循环引用
    __weak RootViewController *weakSelf = self;
    
    sec.myBlock = ^(NSString *value) {
        
        weakSelf.label.text = value;
        
    };
    
    [self presentViewController:sec animated:YES completion:nil];
}

@end
