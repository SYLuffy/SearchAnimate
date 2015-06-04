//
//  ViewController.m
//  SearchAnimate
//
//  Created by user on 15/5/4.
//  Copyright (c) 2015年 JenuryCheng. All rights reserved.
//

#import "ViewController.h"
#import "SearchAnimateView.h"

@interface ViewController ()
{
    SearchAnimateView *_animateView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    _animateView = [[SearchAnimateView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 100)];
    [self.view addSubview:_animateView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClicked:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"开始"]) {
        [btn setTitle:@"停止" forState:UIControlStateNormal];
        [_animateView animate:YES];
    }else
    {
        [btn setTitle:@"开始" forState:UIControlStateNormal];
        [_animateView animate:NO];
    }
}

@end
