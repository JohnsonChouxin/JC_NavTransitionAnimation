//
//  InteractionTransitionAnimation.m
//  
//
//  Created by haobitou on 15/8/12.
//
//

#import "InteractionTransitionAnimation.h"

@interface InteractionTransitionAnimation ()

@property (assign , nonatomic) BOOL canReceive;

@property (strong, nonatomic) UIViewController * remVc;

@end

@implementation InteractionTransitionAnimation

- (void)writeToViewcontroller:(UIViewController *)toVc
{
    self.remVc = toVc;
    [self addPanGestureRecognizer:toVc.view];
}

- (void)addPanGestureRecognizer:(UIView *)view
{
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognizer:)];
    [view addGestureRecognizer:pan];
}

-(void)panRecognizer:(UIPanGestureRecognizer *)pan
{
    CGPoint panPoint = [pan translationInView:pan.view.superview];
    CGPoint locationPoint = [pan locationInView:pan.view.superview];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.isActing = YES;
        // ------判断初始位置，在屏幕上半段才能触发Pop
        if (locationPoint.y <= self.remVc.view.bounds.size.height/2.0) {
            [self.remVc.navigationController popViewControllerAnimated:YES];
        }
    }else if (pan.state == UIGestureRecognizerStateChanged){
        
        if (locationPoint.y >= self.remVc.view.bounds.size.height/2.0) {
            self.canReceive = YES;
        }else{
            self.canReceive = NO;
        }
        
        [self updateInteractiveTransition:panPoint.y/self.remVc.view.bounds.size.height];
        
    }else if (pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded){
        self.isActing = NO;
        if(!self.canReceive || pan.state == UIGestureRecognizerStateCancelled)
        {
            [self cancelInteractiveTransition];
        }else{
            [self finishInteractiveTransition];
        }
    }
}

@end
