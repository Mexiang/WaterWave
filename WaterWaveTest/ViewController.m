//
//  ViewController.m
//  WaterWaveTest
//
//  Created by Dry on 2017/7/28.
//  Copyright © 2017年 Dry. All rights reserved.
//

#import "ViewController.h"
#import "DDWaterVaveView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(clickAnimation:) userInfo:nil repeats:YES];
}

- (void)clickAnimation:(id)sender {
    __block DDWaterVaveView *waterView = [[DDWaterVaveView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:waterView];
    
    [UIView animateWithDuration:2 animations:^{
        waterView.transform = CGAffineTransformScale(waterView.transform, 2, 2);
        waterView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [waterView removeFromSuperview];
    }];
}

@end
