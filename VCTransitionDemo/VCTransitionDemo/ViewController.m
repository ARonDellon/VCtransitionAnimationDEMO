//
//  ViewController.m
//  VCTransitionDemo
//
//  Created by wangweiyi on 16/5/26.
//  Copyright © 2016年 wangweiyi. All rights reserved.
//

#define SCREEN_WIDTH         [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT        [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"
#import "QQmusic.h"
#import "taobao.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *cellArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.cellArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0:{
            taobao *taobaoVC = [[taobao alloc]init];
            [self.navigationController pushViewController:taobaoVC animated:YES];
        }break;
        case 1:{
            QQmusic *musicVC = [[QQmusic alloc]init];
            [self.navigationController pushViewController:musicVC animated:YES];
        }break;
        case 2:{

        }break;

        default:
            break;
    }
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                                 style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)cellArr {
    if (!_cellArr) {
        _cellArr = @[@"类淘宝购物车",@"qq音乐",@"￥#%……&"];
    }
    return _cellArr;
}

@end
