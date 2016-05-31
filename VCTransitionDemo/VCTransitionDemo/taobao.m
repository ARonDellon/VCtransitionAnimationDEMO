//
//  taobao.m
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/26.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#import "taobao.h"
#import "destinationVC.h"

@interface taobao ()

@property (nonatomic,strong)UIButton *presentBtn;


@end

@implementation taobao

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.presentBtn];

}

- (void)buttonClick {
    destinationVC *destination = [[destinationVC alloc]init];
    [self presentViewController:destination animated:YES completion:nil];
}



- (UIButton *)presentBtn {
    if (!_presentBtn) {
        _presentBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
        [_presentBtn setTitle:@"present" forState:UIControlStateNormal];
        [_presentBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _presentBtn;
}

@end
