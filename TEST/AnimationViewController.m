//
//  AnimationViewController.m
//  TEST
//
//  Created by Massimo on 16/5/12.
//  Copyright © 2016年 Massimo. All rights reserved.
//

#import "AnimationViewController.h"
@interface AnimationViewController()
{
  CALayer *_layer;
  CAShapeLayer *_centerLayer;
  UIBezierPath *_path;
}




@end
@implementation AnimationViewController
- (void)viewDidLoad{
  [super viewDidLoad];
  [self addPath];
  [self addLayer];
  
  [self addAnimation];
  
}
//添加动画
- (void)addAnimation{
//  小球运动动画
  CGFloat offset = 10;
  CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
  anima.path = _path.CGPath;
  
//  阴影的位置动画
  CABasicAnimation *shadowAnia = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
  shadowAnia.duration = 1;
  shadowAnia.beginTime = 0;
  shadowAnia.fromValue = [NSValue valueWithCGSize:CGSizeMake(-offset, 0)];
  shadowAnia.toValue = [NSValue valueWithCGSize:CGSizeMake(0, offset)];
  
  CABasicAnimation *shadowAnib = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
  shadowAnib.duration = 1;
  shadowAnib.beginTime = 1;
  shadowAnib.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, offset)];
  shadowAnib.toValue = [NSValue valueWithCGSize:CGSizeMake(offset, 0)];
  
  CABasicAnimation *shadowAnic = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
  shadowAnic.duration = 1;
  shadowAnic.beginTime = 2;
  shadowAnic.fromValue = [NSValue valueWithCGSize:CGSizeMake(offset, 0)];
  shadowAnic.toValue = [NSValue valueWithCGSize:CGSizeMake(0, -offset)];
  
  CABasicAnimation *shadowAnid = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
  shadowAnid.duration = 1;
  shadowAnid.beginTime = 3;
  shadowAnid.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, -offset)];
  shadowAnid.toValue = [NSValue valueWithCGSize:CGSizeMake(-offset, 0)];
  
  
  CAAnimationGroup *group = [CAAnimationGroup animation];
  group.duration = 4;
  group.repeatCount = INTMAX_MAX;
  
  group.animations = @[shadowAnia,shadowAnib,shadowAnic,shadowAnid,anima];
  
  [_layer addAnimation:group forKey:@""];
}
//运动轨迹
- (void)addPath{
  _path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:M_PI endAngle:-M_PI clockwise:NO];
}

- (void)addLayer{
  
 
//  运动轨迹
  _centerLayer = [CAShapeLayer layer];
  _centerLayer.path = _path.CGPath;
  _centerLayer.lineWidth = 2.f;
  _centerLayer.fillColor = [UIColor clearColor].CGColor;
  _centerLayer.strokeColor = [UIColor lightGrayColor].CGColor;

  [self.view.layer addSublayer:_centerLayer];
  
//  小红球
  _layer = [CALayer layer];
  _layer.frame = CGRectMake(30, 30, 30, 30);
  _layer.cornerRadius = 15;
  _layer.shadowColor = [UIColor lightGrayColor].CGColor;
  _layer.shadowOffset = CGSizeMake(-5, 0);
  _layer.shadowOpacity = 1;
  _layer.shadowRadius = 1;
  _layer.backgroundColor = [UIColor redColor].CGColor;
  [self.view.layer addSublayer:_layer];
  
  
}

@end
