//
//  InteractionTransitionAnimation.h
//  
//
//  Created by haobitou on 15/8/12.
//
//
/*
 基于 UIPercentDrivenInteractiveTransition 的可交互基类
 */


#import <UIKit/UIKit.h>

@interface InteractionTransitionAnimation : UIPercentDrivenInteractiveTransition

@property (assign , nonatomic) BOOL isActing;/** 判断动画正在进行中*/

-(void)writeToViewcontroller:(UIViewController *)toVc;/** 写入二级ViewController*/

@end
