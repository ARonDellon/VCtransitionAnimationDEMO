//
//  interactiveControl.m
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/6/1.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import "interactiveControl.h"

@interface interactiveControl ()

@property (nonatomic,strong)UIViewController *secondController;
@property (nonatomic,strong)UIScreenEdgePanGestureRecognizer *panGes;


@end

@implementation interactiveControl


- (instancetype)init {
    if (self = [super init]) {
        self.isReady = NO;
    }
    return self;
}

- (void)addGestureToViewController:(UIViewController *)secondVC {
    self.secondController = secondVC;
    [self.secondController.view addGestureRecognizer:self.panGes];
}


- (UIScreenEdgePanGestureRecognizer *)panGes {
    if (!_panGes) {
        _panGes = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
        _panGes.edges = UIRectEdgeLeft;
    }
    return _panGes;
}

- (void)handleGesture: (UIScreenEdgePanGestureRecognizer *)sender {
    CGFloat persent = [sender translationInView:sender.view].x/CGRectGetWidth(self.secondController.view.frame);
    NSLog(@"%f",persent);
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:{
            self.isReady = YES;
            [self.secondController.navigationController popViewControllerAnimated:YES];
        }break;
            
        case UIGestureRecognizerStateChanged:{
            [self updateInteractiveTransition:persent];
        }break;

        case UIGestureRecognizerStateEnded:{
            self.isReady = NO;
            if (persent > 0.5) {
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
        }break;

        default:
            break;
    }
}

@end
