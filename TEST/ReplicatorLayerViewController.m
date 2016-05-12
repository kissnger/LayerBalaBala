//
//  ReplicatorLayerViewController.m
//  TEST
//
//  Created by Massimo on 16/5/11.
//  Copyright © 2016年 Massimo. All rights reserved.123@#
//

#import "ReplicatorLayerViewController.h"
@interface ReplicatorLayerViewController()
@property (nonatomic, strong) CAReplicatorLayer *reLayer;


@end
@implementation ReplicatorLayerViewController
- (void)viewDidLoad{
  [super viewDidLoad];
  [self addLayer];
}

- (void)startAnimation{
 
  
}


- (void)addLayer{
  double count = 8;
  
//  创建 CAReplicatorLayer；
  _reLayer = [CAReplicatorLayer layer];
  _reLayer.frame = CGRectMake(0, 0, 200, 30);
  _reLayer.position = self.view.center;
  _reLayer.instanceCount = count;
  
  _reLayer.preservesDepth = NO;
  _reLayer.instanceDelay = 2/count;
  _reLayer.instanceTransform = CATransform3DMakeTranslation(200/count, 0, 0);
  [self.view.layer addSublayer:_reLayer];
  
//  CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"instanceCount"];
//  anim.fromValue = @(8);
//  anim.toValue = @(3);
//  anim.beginTime = 0;
//  anim.duration = 1;
//  anim.repeatCount = INTMAX_MAX;
//  [_reLayer addAnimation:anim forKey:@""];
  
  CGFloat itemWidth = 200/count*0.7;
//  创建item；
  CALayer *layer = [CALayer layer];
  layer.frame = CGRectMake(0, 0, itemWidth, itemWidth);
  layer.backgroundColor = [UIColor redColor].CGColor;
  [_reLayer addSublayer:layer];
//  创建缩放动画；
  CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
  ani.fromValue = @(1.0);
  ani.toValue = @(0.5);
  ani.beginTime = 0;
  ani.duration = 1;
  CABasicAnimation *ani4 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
  ani4.fromValue = @(0.5);
  ani4.toValue = @(1.0);
  ani4.beginTime = 1;
  ani4.duration = 1;
// 创建透明度动画；
  CABasicAnimation *ani1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
  ani1.fromValue = @(1.0);
  ani1.toValue = @(0);
   ani1.beginTime = 0;
//  
//  CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"position.y"];
//  ani2.fromValue = @(0);
//  ani2.toValue = @(-3);
//  ani2.duration = 0.1;
//  ani2.beginTime = 0;
//  CABasicAnimation *ani3 = [CABasicAnimation animationWithKeyPath:@"position.y"];
//  ani3.fromValue = @(-3);
//  ani3.toValue = @(0);
//  ani3.duration = 0.1;
//  ani3.beginTime = 0.1;
//  奖透明度动画和缩放动画放到动画组中；
  CAAnimationGroup *group = [CAAnimationGroup animation];
  group.duration = 2;
  group.repeatCount = INTMAX_MAX;
  group.animations = @[ani,ani4];
//  给item添加动画；
  [layer addAnimation:group forKey:@""];
}


@end
