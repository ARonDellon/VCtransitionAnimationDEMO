//
//  interactiveControl.h
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/6/1.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface interactiveControl : UIPercentDrivenInteractiveTransition

@property (nonatomic,assign)BOOL isReady;

- (void)addGestureToViewController:(UIViewController *)secondVC;

@end
