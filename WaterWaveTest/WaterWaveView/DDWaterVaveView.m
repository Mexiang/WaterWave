//
//  DDWaterVaveView.m
//  WaterWaveTest
//
//  Created by Dry on 2017/7/28.
//  Copyright © 2017年 Dry. All rights reserved.
//

#import "DDWaterVaveView.h"

@interface DDWaterVaveView ()

@property (nonatomic) NSTimer     *timer;

@end

@implementation DDWaterVaveView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //最初半径
    CGFloat radius = self.frame.size.width * 0.5;
    //开始角
    CGFloat startAngle = 0;
    //结束角
    CGFloat endAngle = 2 * M_PI;
    //中心点
    NSLog(@"------ %f",self.frame.size.width);//这里放大多少就取放大值的2倍的分之一
    CGPoint center = CGPointMake(self.frame.size.width*0.25, self.frame.size.height*0.25);
    //画圆
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    //生成layer对象
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = bezierPath.CGPath;//设置path
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;//圆边框颜色
    shapeLayer.fillColor = [UIColor lightGrayColor].CGColor;//圆填充颜色
    //添加layer对象
    [self.layer addSublayer:shapeLayer];
}

@end
