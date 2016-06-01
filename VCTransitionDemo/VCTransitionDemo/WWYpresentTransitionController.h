//
//  taobaoTransitionController.h
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/30.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWYpresentTransitionController : UIViewController<UIViewControllerTransitioningDelegate>

+ (WWYpresentTransitionController *)sharedInstanceTypeWithPresentingVC:(UIViewController *)presentingVC;

@property (nonatomic,assign,readonly)UIModalPresentationStyle modalStyle;

@end
