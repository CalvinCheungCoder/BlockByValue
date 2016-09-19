//
//  SecViewController.h
//  KVOByValue
//
//  Created by 张丁豪 on 16/9/19.
//  Copyright © 2016年 张丁豪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BlockValue)(NSString *value);

@interface SecViewController : UIViewController

@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) UIButton *button;

@property (copy, nonatomic) BlockValue myBlock;

@end
