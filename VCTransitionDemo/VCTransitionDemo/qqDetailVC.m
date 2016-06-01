//
//  qqDetailVC.m
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/31.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import "qqDetailVC.h"
#import "QQmusic.h"

@interface qqDetailVC ()


@end

@implementation qqDetailVC

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.view2];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}



- (UIView *)view2 {
    if (!_view2) {
        _view2 = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 100, 300)];
        _view2.backgroundColor = [UIColor redColor];
    }
    return _view2;
}



@end
