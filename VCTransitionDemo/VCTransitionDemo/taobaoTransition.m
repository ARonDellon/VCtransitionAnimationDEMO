//
//  taobaoTransition.m
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/27.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kKeyWindow [UIApplication sharedApplication].keyWindow



#import "taobaoTransition.h"

NSString * dismissSelector = @"dismissPresentingViewController";

@interface taobaoTransition ()

@property (nonatomic,strong)UIViewController *controlVC;

@property (nonatomic,assign)kModalTransitionType type;
@property (nonatomic,assign)NSTimeInterval duration;
@property (nonatomic,assign)CGFloat presentHeight;
@property (nonatomic,assign)CGPoint scale;

@end

@implementation taobaoTransition

+ (instancetype)configTransitionWithTransitionType:(kModalTransitionType)type
                                          duration:(NSTimeInterval)duration
                                     presentHeight:(CGFloat)presentHeight
                                             scale:(CGPoint)scale
                                      controllerVC:(UIViewController *)controlVC{
    taobaoTransition *transition = [[taobaoTransition alloc]init];
    transition.type = type;
    transition.duration = duration;
    transition.presentHeight = presentHeight;
    transition.scale = scale;
    transition.controlVC = controlVC;
    return transition;
}



- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case kModalTransitionTypePresent:{
            [self presentTransition:transitionContext];

        }break;
        case kModalTransitionTypeDismiss:{
            [self disMissTransition:transitionContext];
        }break;

        default:
            break;
    }

}

- (void)presentTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    UIView *containerView = [transitionContext containerView];
    containerView.userInteractionEnabled = YES;
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *screenShot = [fromViewController.view snapshotViewAfterScreenUpdates:YES];
    screenShot.userInteractionEnabled = YES;
    screenShot.frame = fromViewController.view.frame;


    [containerView addSubview:screenShot];
    [containerView addSubview:({
        UIView *view = [[UIView alloc]initWithFrame:fromViewController.view.frame];
        view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        SEL selector = NSSelectorFromString(dismissSelector);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self.controlVC action:selector];
        [view addGestureRecognizer:tap];
        view;
    })];
    [containerView addSubview:toViewController.view];

    toViewController.view.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight/2);
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];

    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:transitionDuration animations:^{
        toViewController.view.frame = CGRectMake(0, kScreenHeight/2, kScreenWidth, kScreenHeight/2);
        fromViewController.view.transform = CGAffineTransformMakeScale(weakSelf.scale.x, weakSelf.scale.y);
        screenShot.transform = CGAffineTransformMakeScale(weakSelf.scale.x, weakSelf.scale.y);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

}

- (void)disMissTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = containerView.subviews.firstObject;;

    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];

    [UIView animateWithDuration:transitionDuration animations:^{
        fromView.transform = CGAffineTransformIdentity;
        toViewController.view.transform = CGAffineTransformIdentity;
        fromViewController.view.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight/2);
    } completion:^(BOOL finished) {
        [fromView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

}




@end
