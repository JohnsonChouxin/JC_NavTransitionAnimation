//
//  InteractiveTrasitionAnimation.h
//  JC_NavTransitionAnimation
//
//  Created by haobitou on 15/8/12.
//  Copyright (c) 2015年 haobitou. All rights reserved.
//
/*
 基于 UIViewControllerInteractiveTransitioning 协议的可交互基类
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InteractiveTrasitionAnimation : NSObject<UIViewControllerInteractiveTransitioning>

@property (assign , nonatomic) BOOL isActing;/** 判断动画正在进行中*/

-(void)writeToViewcontroller:(UIViewController *)toVc;/** 写入二级ViewController*/

- (void)updateInteractiveTransition:(CGFloat)percentComplete;/** 更新交互进度*/

- (void)cancelInteractiveTransition;/** 取消切换*/

- (void)finishInteractiveTransition;/** 完成切换*/

@end
