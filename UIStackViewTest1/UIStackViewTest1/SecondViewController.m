//
//  SecondViewController.m
//  UIStackViewTest1
//
//  Created by myh on 16/7/11.
//  Copyright © 2016年 myh. All rights reserved.
//
#warning 做评分效果可以
#define kWIGTH [UIScreen mainScreen].bounds.size.width
#define kHEIGHT [UIScreen mainScreen].bounds.size.height

#import "SecondViewController.h"

@interface SecondViewController (){

    UIStackView *_stackView;


}
@property(nonatomic,strong)UIStackView * horizontalView;
@end

@implementation SecondViewController
- (UIStackView *)horizontalView
{
    if (!_horizontalView) {
        _horizontalView = [[UIStackView alloc] init];
        _horizontalView.axis = UILayoutConstraintAxisHorizontal;
        // distribution 分配
        _horizontalView.distribution = UIStackViewDistributionFillEqually;
        _horizontalView.spacing = 10;
        _horizontalView.alignment = UIStackViewAlignmentFill;
        
    }
    return _horizontalView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   self.title = @"Second";
    [self setupUI];

}
- (void)setupUI{
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

    _stackView = [[UIStackView alloc]initWithFrame:CGRectMake(0, 0, kWIGTH, kHEIGHT-150)];
    //  不同于其他的view UIStackView不会被渲染到layer 设置颜色什么的都不会奏效 就好比一个容器他本身是容纳盛装其他的view的 本身不显示 但是在Debuge里面是可以看到的
    _stackView.backgroundColor  = [UIColor redColor]; // 无效
    _stackView.axis = UILayoutConstraintAxisHorizontal;
    _stackView.distribution = UIStackViewDistributionFill;
    _stackView.spacing = 10;
    _stackView.alignment = UIStackViewAlignmentFill; // UIStackViewAlignmentCenter此处我用center不出现
    [self.view addSubview:_stackView];





}


- (UIImageView *)setupImageView{
    UIImageView *imageView = [[UIImageView alloc]init];
   
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    NSString *strImage  = [NSString stringWithFormat:@"222_%d.jpg",arc4random()%16+1];
    imageView.image = [UIImage imageNamed:strImage];

    return imageView;
}
// 增加
- (void)addClicked{
    UIImageView *imageview = [self setupImageView];;
    if (self.horizontalView != nil) {
        [_stackView addArrangedSubview:self.horizontalView];
    }
    [self.horizontalView addArrangedSubview:imageview];
    [UIView animateWithDuration:0.25 animations:^{
        [self.horizontalView layoutIfNeeded]; // 此句话要不要都可以  要最好价格动画平滑一点 没那么生硬
    }];
    
    
}
// 减少
- (void)reduceClicked{
    
    UIImageView *imageView = [self.horizontalView.subviews lastObject];
    [self.horizontalView removeArrangedSubview:imageView];
    [imageView removeFromSuperview];// 这句话也要加上 或则会出问题
    [UIView animateWithDuration:0.25 animations:^{
        [self.horizontalView layoutIfNeeded];
    }];
    
    
    
    
}
@end
