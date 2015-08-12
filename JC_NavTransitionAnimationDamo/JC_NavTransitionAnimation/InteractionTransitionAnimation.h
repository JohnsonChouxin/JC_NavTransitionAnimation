//
//  InteractionTransitionAnimation.h
//  
//
//  Created by haobitou on 15/8/12.
//
//

#import <UIKit/UIKit.h>

@interface InteractionTransitionAnimation : UIPercentDrivenInteractiveTransition

@property (assign , nonatomic) BOOL isActing;

-(void)writeToViewcontroller:(UIViewController *)toVc;

@end
