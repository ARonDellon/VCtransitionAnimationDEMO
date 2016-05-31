//
//  taobaoTransition.h
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/27.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, kModalTransitionType) {
    kModalTransitionTypePresent = 1 << 1,
    kModalTransitionTypeDismiss = 1 << 2
};

@interface taobaoTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)configTransitionWithTransitionType:(kModalTransitionType)type
                                          duration:(NSTimeInterval)duration
                                     presentHeight:(CGFloat)presentHeight
                                             scale:(CGPoint)scale
                                      controllerVC:(UIViewController *)controlVC;


@end
