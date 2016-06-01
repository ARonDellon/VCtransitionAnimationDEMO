//
//  pushAnimationControl.m
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/6/1.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import "pushAnimationControl.h"

@implementation pushAnimationControl



- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactiveTrasition.isReady?self.interactiveTrasition:nil;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {

    if (operation == UINavigationControllerOperationPush) {
        if ([fromVC isKindOfClass:[QQmusic class]]) {
            QQmusic *fromViewController = (QQmusic *)fromVC;
            qqDetailVC *toViewController = (qqDetailVC *)toVC;
            return [oneViewMovePushTransition configTransitionWithType:transitionType_push
                                                              duration:1
                                                    moveViewOnFromView:fromViewController.view1
                                                          viewOnToView:toViewController.view2
                                                             controlVC:self];
        }

    }

    if (operation == UINavigationControllerOperationPop) {
        if ([fromVC isKindOfClass:[qqDetailVC class]]) {
            QQmusic *toViewController = (QQmusic *)toVC;
            qqDetailVC *fromViewController = (qqDetailVC *)fromVC;
            return [oneViewMovePushTransition configTransitionWithType:transitionType_pop
                                                              duration:1
                                                    moveViewOnFromView:fromViewController.view2
                                                          viewOnToView:toViewController.view1
                                                             controlVC:self];

        }
        
    }
    return nil;
}

- (interactiveControl *)interactiveTrasition {
    if (!_interactiveTrasition) {
        _interactiveTrasition = [[interactiveControl alloc]init];
    }
    return _interactiveTrasition;
}


@end
