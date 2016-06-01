//
//  QQmusic.m
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/26.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import "QQmusic.h"
#import "qqDetailVC.h"
#import "pushAnimationControl.h"

@interface QQmusic ()

@property (nonatomic,strong)pushAnimationControl *controller;

@end

@implementation QQmusic


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];

    self.navigationController.delegate = self.controller;
    [self.view addSubview:self.view1];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(push)];
    [self.view addGestureRecognizer:tap];

}


- (void)push {
    qqDetailVC *detail = [[qqDetailVC alloc] init];
    [self.controller.interactiveTrasition addGestureToViewController:detail];
    [self.navigationController pushViewController:detail animated:YES];
}


- (UIView *)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _view1.backgroundColor = [UIColor redColor];
    }
    return _view1;
}

- (pushAnimationControl *)controller {
    if (!_controller) {
        _controller = [[pushAnimationControl alloc]init];
    }
    return _controller;
}



@end
