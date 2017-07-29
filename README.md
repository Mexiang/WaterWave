# WaterWave
## 实现效果
水波纹从中心从外侧扩散的效果实现：
![wave.png](http://upload-images.jianshu.io/upload_images/2056220-713829c1b209be3b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 实现思路
1、通过一个定时器等，重复的创建一个圆；
2、将创建的圆，进行倍数放大，实现扩散效果；
3、将放大的圆的透明度从1~0做一个变化，实现往外淡出的效果；
4、放大后的圆视图从父视图上移除。
这样，创建、扩大、移除中实现水波纹扩散的效果。当然对于圆圈视图需要再其内部通过- (void)drawRect:(CGRect)rect方法画圆。

## 代码如下
### 写一个圆圈视图DDWaterVaveView
```
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
```
### 调用实现效果
```
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
```
## 说明
查了查资料自己整理的，只是做了代码的搬运工而已。我看了网上还有其他实现思路，也是可以借鉴的。此外本篇的实现封装的并不是很彻底。
大家有不同的思路或者想法可以互相交流。

<http://www.jianshu.com/p/d3844be1d4ad>

