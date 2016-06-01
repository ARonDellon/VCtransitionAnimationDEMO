//
//  oneViewMovePushTransition.m
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/31.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import "oneViewMovePushTransition.h"


@interface oneViewMovePushTransition ()

@property (nonatomic,assign)transitionType type;
@property (nonatomic,strong)UIView *viewOnFromVC;
@property (nonatomic,strong)UIView *viewOnToVC;
@property (nonatomic,strong)UIViewController *controlVC;
@property (nonatomic,assign)NSTimeInterval duration;

@end

@implementation oneViewMovePushTransition

+ (oneViewMovePushTransition *)configTransitionWithType:(transitionType)type
                                               duration:(NSTimeInterval)duration
                                     moveViewOnFromView:(UIView *)moveView
                                           viewOnToView:(UIView *)desView
                                              controlVC:(UIViewController *)controlVC{

    oneViewMovePushTransition * share = [[oneViewMovePushTransition alloc]init];

    share.type = type;
    share.duration = duration;
    share.viewOnFromVC = moveView;
    share.viewOnToVC = desView;
    share.controlVC = controlVC;
    return share;
}

- (instancetype)init {
    if (self = [super init]) {

    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case transitionType_pop:{
            [self popTransition:transitionContext];
        }break;
        case transitionType_push:{
            [self pushTransition:transitionContext];
        }break;

        default:
            break;
    }
}

- (void)pushTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];

    UIView *moveViewSnapView = [self.viewOnFromVC snapshotViewAfterScreenUpdates:YES];

    CGRect moveViewRectInFromView = [self.viewOnFromVC.superview convertRect:self.viewOnFromVC.frame toView:fromVC.view];
    CGRect moveViewRectInToView = [self.viewOnToVC.superview convertRect:self.viewOnToVC.frame toView:toVC.view];


    moveViewSnapView.frame = moveViewRectInFromView;
    toVC.view.alpha = 0;
    [containerView addSubview:toVC.view];
    [containerView addSubview:moveViewSnapView];

    [UIView animateWithDuration:self.duration animations:^{
        toVC.view.alpha = 1;
        moveViewSnapView.frame = moveViewRectInToView;
    }completion:^(BOOL finished) {
        [moveViewSnapView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];



}

- (void)popTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];

    UIView *moveViewSnapView = [self.viewOnFromVC snapshotViewAfterScreenUpdates:YES];

    CGRect moveViewRectInFromView = [self.viewOnFromVC.superview convertRect:self.viewOnFromVC.frame toView:fromVC.view];
    CGRect moveViewRectInToView = [self.viewOnToVC.superview convertRect:self.viewOnToVC.frame toView:toVC.view];

    if (CGRectIntersectsRect(moveViewRectInToView, toVC.view.frame)) {

    }
    moveViewSnapView.frame = moveViewRectInFromView;
    [containerView addSubview:toVC.view];
    [containerView addSubview:fromVC.view];
    [containerView addSubview:moveViewSnapView];

    fromVC.view.alpha = 1;

    [UIView animateWithDuration:self.duration animations:^{
        fromVC.view.alpha = 0;
        moveViewSnapView.frame = moveViewRectInToView;
    }completion:^(BOOL finished) {
        if (![transitionContext transitionWasCancelled]) {
            [fromVC.view removeFromSuperview];
        }
        [moveViewSnapView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}



@end
