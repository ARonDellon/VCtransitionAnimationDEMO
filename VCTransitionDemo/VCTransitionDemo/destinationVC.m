//
//  destinationVC.m
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/26.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import "destinationVC.h"
#import "WWYpresentTransitionController.h"

@interface destinationVC ()


@property (nonatomic,strong)WWYpresentTransitionController *transition;


@end

@implementation destinationVC

- (instancetype)init {
    if (self = [super init]) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.transitioningDelegate = self.transition;
    self.modalPresentationStyle = self.transition.modalStyle;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (WWYpresentTransitionController *)transition {
    if (!_transition) {
        _transition = [WWYpresentTransitionController sharedInstanceTypeWithPresentingVC:self];
    }
    return _transition;
}



@end
