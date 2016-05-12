//
//  ShareLayerViewController.m
//  TEST
//
//  Created by Massimo on 16/5/11.
//  Copyright © 2016年 Massimo. All rights reserved.
//

#import "ShareLayerViewController.h"
@interface ShareLayerViewController()
@property (nonatomic, strong) UIBezierPath *kPatch;
@property (nonatomic, strong) CABasicAnimation *start;
@property (nonatomic, strong) CABasicAnimation *end;
@property (nonatomic, strong) CAShapeLayer *kShapeLayer;
@property (nonatomic, weak) IBOutlet UIView *content;

@end
@implementation ShareLayerViewController

- (void)viewDidLoad{
  [super viewDidLoad];
  _kPatch = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100,100) radius:80
                                       startAngle:-M_PI endAngle:M_PI clockwise:YES];
  
  [self addLayer];
}
- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
 
  [self startAnimation];
}
- (void)startAnimation{
  _start = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
  _start.fromValue =@(0);
  _start.toValue = @(1);
  _start.duration = 1;
  _start.beginTime = 0;
  _start.repeatCount = 1;
  
  _end = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  _end.fromValue =@(0);
  _end.toValue = @(1);
  _end.duration = 1;
  _end.beginTime = 1;
  _end.repeatCount = 1;
  
  CAAnimationGroup *group = [CAAnimationGroup animation];
  group.animations = @[_end,_start];
  group.duration = 2;
  group.repeatCount = INTMAX_MAX;
  group.autoreverses = NO;
  [_kShapeLayer addAnimation:group forKey:@""];
//  layer的容器旋转动画
  CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
  ani.fromValue = [NSNumber numberWithFloat:0.f];
  ani.toValue = [NSNumber numberWithFloat:M_PI*2];
  ani.duration = 2;
  ani.repeatCount = INTMAX_MAX;
  ani.removedOnCompletion = NO;
  ani.fillMode = kCAFillModeForwards;
  
  [_content.layer addAnimation:ani forKey:@""];
}
-(void)stopAnimation{
  [_content.layer removeAllAnimations];
  [_kShapeLayer removeAllAnimations];
}

- (IBAction)selector:(UIButton*)sender{
  sender.selected = !sender.selected;
  if (sender.selected) {
    [self stopAnimation];
  }else{
    [self startAnimation];
  }
}

- (void)addLayer{
  
  _kShapeLayer = [CAShapeLayer layer];

  _kShapeLayer.path = _kPatch.CGPath;
  
  _kShapeLayer.strokeColor = [UIColor redColor].CGColor;
  _kShapeLayer.fillColor = [UIColor clearColor].CGColor;
  _kShapeLayer.lineWidth = 10.f;
  //  _kShapeLayer.strokeStart = 1.1;
  [self.content.layer addSublayer:_kShapeLayer];
}
@end
