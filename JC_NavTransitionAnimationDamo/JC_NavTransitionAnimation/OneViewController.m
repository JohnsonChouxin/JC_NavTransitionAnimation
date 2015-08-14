//
//  OneViewController.m
//  JC_NavTransitionAnimation
//
//  Created by haobitou on 15/8/12.
//  Copyright (c) 2015年 haobitou. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

#import "JC_NacAnimation.h"

@interface OneViewController ()<UINavigationControllerDelegate>

@property (strong, nonatomic) UIButton * pushButton;

@property (strong, nonatomic) PushTransition * pushAnimation;

@property (strong, nonatomic) PopTransition  * popAnimation;

@property (strong, nonatomic) InteractionTransitionAnimation * popInteraction;

@property (strong, nonatomic) InteractiveTrasitionAnimation * popInteractive;

@end

@implementation OneViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pushButton];
}

#pragma mark - **************** Navgation delegate
/** 返回转场动画实例*/
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimation;
    }else if (operation == UINavigationControllerOperationPop){
        return self.popAnimation;
    }
    return nil;
}
/** 返回交互手势实例*/
-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                        interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
//    return self.popInteraction.isActing ? self.popInteraction : nil;
    return self.popInteractive.isActing ? self.popInteractive : nil;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"willShowViewController - %@",self.popInteraction.isActing ?@"YES":@"NO");
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"didShowViewController - %@",self.popInteraction.isActing ?@"YES":@"NO");
}

#pragma mark - **************** private methods
- (void)abc
{
    TwoViewController * two = [TwoViewController new];
    [self.popInteraction writeToViewcontroller:two];
    [self.navigationController pushViewController:two animated:YES];
}

#pragma mark - **************** Initializes attributes
-(UIButton *)pushButton
{
    if (!_pushButton) {
        _pushButton = [[UIButton alloc] init];
        [_pushButton setTitle:@"PUSH" forState:UIControlStateNormal];
        [_pushButton addTarget:self action:@selector(abc) forControlEvents:UIControlEventTouchUpInside];
        _pushButton.bounds = CGRectMake(0, 0, 100, 100);
        _pushButton.center = self.view.center;
    }
    return _pushButton;
}
-(PushTransition *)pushAnimation
{
    if (!_pushAnimation) {
        _pushAnimation = [[PushTransition alloc] init];
    }
    return _pushAnimation;
}
-(PopTransition *)popAnimation
{
    if (!_popAnimation) {
        _popAnimation = [[PopTransition alloc] init];
    }
    return _popAnimation;
}
-(InteractionTransitionAnimation *)popInteraction
{
    if (!_popInteraction) {
        _popInteraction = [[InteractionTransitionAnimation alloc] init];
    }
    return _popInteraction;
}
-(InteractiveTrasitionAnimation *)popInteractive
{
    if (!_popInteractive) {
        _popInteractive = [[InteractiveTrasitionAnimation alloc] init];
    }
    return _popInteractive;
}
@end
