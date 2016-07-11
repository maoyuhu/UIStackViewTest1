//
//  RootVC.m
//  UIStackViewTest1
//
//  Created by myh on 16/7/11.
//  Copyright © 2016年 myh. All rights reserved.
//
#import "ViewController.h"
#import "SecondViewController.h"
#import "RootVC.h"

@interface RootVC ()<UITableViewDelegate,UITableViewDataSource>{

    UITableView *_tableView;

}

@end

@implementation RootVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"ROOT";
    [self setupUI];


}
#pragma mark 创建tableView 及代理方法
-(void)setupUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    if (0 == indexPath.row) {
        cell.textLabel.text = @"labeltest";
    }if (1==indexPath.row) {
        cell.textLabel.text = @"复合test";
    }
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 ==  indexPath.row) {
        ViewController *vc = [[ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (1 == indexPath.row){
    
        SecondViewController *second = [[SecondViewController alloc]init];
        [self.navigationController pushViewController:second animated:YES];
    
    }



}

@end
