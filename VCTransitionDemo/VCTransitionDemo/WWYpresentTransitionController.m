//
//  taobaoTransitionController.m
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/30.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import "WWYpresentTransitionController.h"
#import "taobaoTransition.h"

@interface WWYpresentTransitionController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic,strong)UIViewController *presentingVC;
@property (nonatomic,assign,readwrite)UIModalPresentationStyle modalStyle;

@end

@implementation WWYpresentTransitionController

+ (WWYpresentTransitionController *)sharedInstanceTypeWithPresentingVC:(UIViewController *)presentingVC {

    WWYpresentTransitionController*  share = [[WWYpresentTransitionController alloc]init];
    share.presentingVC = presentingVC;
    share.modalStyle = UIModalPresentationCustom;
    return share;
}


- (void)dismissPresentingViewController {
    [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [taobaoTransition configTransitionWithTransitionType:kModalTransitionTypePresent
                                                       duration:0.3
                                                  presentHeight:400
                                                          scale:CGPointMake(0.9, 0.9)
                                                   controllerVC:self];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [taobaoTransition configTransitionWithTransitionType:kModalTransitionTypeDismiss
                                                       duration:0.3
                                                  presentHeight:400
                                                          scale:CGPointMake(0.9, 0.9)
                                                   controllerVC:self];}




@end
