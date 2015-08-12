//
//  TwoViewController.m
//  JC_NavTransitionAnimation
//
//  Created by haobitou on 15/8/12.
//  Copyright (c) 2015年 haobitou. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@property (strong, nonatomic) UIButton * popButton;

@end

@implementation TwoViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.popButton];
}
#pragma mark - **************** private methods
- (void)abc
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - **************** Initializes attributes
-(UIButton *)popButton
{
    if (!_popButton) {
        _popButton = [[UIButton alloc] init];
        [_popButton setTitle:@"POP" forState:UIControlStateNormal];
        [_popButton addTarget:self action:@selector(abc) forControlEvents:UIControlEventTouchUpInside];
        _popButton.bounds = CGRectMake(0, 0, 100, 100);
        _popButton.center = self.view.center;
    }
    return _popButton;
}
@end
