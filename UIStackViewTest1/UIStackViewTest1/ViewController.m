//
//  ViewController.m
//  UIStackViewTest1
//
//  Created by myh on 16/7/11.
//  Copyright © 2016年 myh. All rights reserved.
//
#define kWIGTH [UIScreen mainScreen].bounds.size.width
#define kHEIGHT [UIScreen mainScreen].bounds.size.height


#import "ViewController.h"

@interface ViewController (){

    UIStackView *_stackView;


}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor yellowColor];
    self.title = @"ViewContorller";
    [self setupUI];
 
}
- (void)setupUI{

    _stackView = [[UIStackView alloc]initWithFrame:CGRectMake(0, 100, kWIGTH, 200)];
    //  不同于其他的view UIStackView不会被渲染到layer 设置颜色什么的都不会奏效 就好比一个容器他本身是容纳盛装其他的view的 本身不显示 但是在Debuge里面是可以看到的
    _stackView.backgroundColor  = [UIColor redColor]; // 无效
    _stackView.axis = UILayoutConstraintAxisVertical;
    _stackView.distribution = UIStackViewDistributionFill;
    _stackView.spacing = 10;
    _stackView.alignment = UIStackViewAlignmentFill; // UIStackViewAlignmentCenter此处我用center不出现
    [self.view addSubview:_stackView];

    UIButton *addButton=[[UIButton alloc]initWithFrame:CGRectMake(50, kHEIGHT - 50, 100, 50)];
    [addButton setTitle:@"增加" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addClicked) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:addButton];
    
    UIButton *reuceButton=[[UIButton alloc]initWithFrame:CGRectMake(150, kHEIGHT - 50, 100, 50)];
    [reuceButton setTitle:@"减少" forState:UIControlStateNormal];
    [reuceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reuceButton addTarget:self action:@selector(reduceClicked) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:reuceButton];
    
    
}
// 增加
- (void)addClicked{
    UILabel *label = [[UILabel alloc]init];
    label.text = @"测试";
    label.backgroundColor  = [UIColor blueColor ];
    [_stackView addArrangedSubview:label];
    [UIView animateWithDuration:0.25 animations:^{
        [_stackView layoutIfNeeded]; // 此句话要不要都可以  要最好价格动画平滑一点 没那么生硬
    }];


}
// 减少
- (void)reduceClicked{

    UIView *view = [_stackView.subviews lastObject];
    [_stackView removeArrangedSubview:view];
    [view removeFromSuperview];// 这句话也要加上 或则会出问题
    [UIView animateWithDuration:0.25 animations:^{
        [_stackView layoutIfNeeded];
    }];




}
@end
