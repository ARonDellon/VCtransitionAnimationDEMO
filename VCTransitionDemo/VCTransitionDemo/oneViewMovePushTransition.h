//
//  oneViewMovePushTransition.h
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/31.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger , transitionType) {
    transitionType_push = 1 << 1,
    transitionType_pop = 1 << 2
};

@interface oneViewMovePushTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (oneViewMovePushTransition *)configTransitionWithType:(transitionType)type
                                               duration:(NSTimeInterval)duration
                                     moveViewOnFromView:(UIView *)moveView
                                           viewOnToView:(UIView *)desView
                                              controlVC:(UIViewController *)controlVC;

@end
