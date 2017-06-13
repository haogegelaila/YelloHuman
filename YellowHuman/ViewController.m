//
//  ViewController.m
//  YellowHuman
//
//  Created by 浩哥哥 on 2017/6/1.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import "ViewController.h"
#import "HumanView.h"
@interface ViewController ()
@property (nonatomic, strong) HumanView *humanView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.humanView = [[HumanView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_humanView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
