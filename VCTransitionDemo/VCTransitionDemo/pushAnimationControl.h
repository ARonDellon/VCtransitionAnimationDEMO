//
//  pushAnimationControl.h
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/6/1.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQmusic.h"
#import "qqDetailVC.h"
#import "oneViewMovePushTransition.h"
#import "interactiveControl.h"


@interface pushAnimationControl : UIViewController<UINavigationControllerDelegate>


@property (nonatomic,strong)interactiveControl *interactiveTrasition;

@end
