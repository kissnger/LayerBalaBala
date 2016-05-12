//
//  LayerViewController.m
//  TEST
//
//  Created by Massimo on 16/5/7.
//  Copyright © 2016年 Massimo. All rights reserved.
//

#import "LayerViewController.h"
@interface LayerViewController()
{
  CGFloat count;
  CGFloat persent ;
}
@property (nonatomic, weak)IBOutlet UIView *layerContent;
@property (nonatomic, weak)IBOutlet UILabel *persentLabel;
@property (nonatomic, weak)IBOutlet UISlider *slider;
@property (nonatomic, strong) CAReplicatorLayer *reLayer;
@property (nonatomic, strong) CAReplicatorLayer *valueLayer;
@end
@implementation LayerViewController
- (void)viewDidLoad{
  [super viewDidLoad];
 
}

- (void)viewDidLayoutSubviews{
  [super viewDidLayoutSubviews];
 
  
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  
  count = 100;
  persent =0.4;
  
  _slider.value = persent;
  
  _persentLabel.text = [NSString stringWithFormat:@"%.0f%%",persent*100];
  
  _reLayer = [CAReplicatorLayer layer];
  _reLayer.frame = _layerContent.bounds;
  
  _reLayer.instanceCount = count;
  _reLayer.preservesDepth = NO;
  _reLayer.instanceDelay = 1/count;
 

  _reLayer.instanceColor = [UIColor whiteColor].CGColor;
   CGFloat angle = M_PI * 2.0 / count;
  _reLayer.transform = CATransform3DMakeRotation(M_PI*1.25, 0, 0, 1);
    _reLayer.instanceTransform = CATransform3DMakeRotation(angle*0.75, 0.0, 0.0, 1.0);
  [self.layerContent.layer addSublayer:_reLayer];
  
  CALayer *layer = [CALayer layer];
  CGFloat width = 3;
  layer.frame = CGRectMake(100, 0, width, width*3);
  layer.bounds = CGRectMake(0, 0, width, width*3);
  layer.opacity = 1.0;
  layer.backgroundColor = [UIColor lightGrayColor].CGColor;
  [_reLayer addSublayer:layer];
  
  
  
  
  _valueLayer = [CAReplicatorLayer layer];
  _valueLayer.frame = _layerContent.bounds;
  
  _valueLayer.instanceCount = count*persent;
  _valueLayer.preservesDepth = NO;
  _valueLayer.instanceColor = [UIColor whiteColor].CGColor;
  _valueLayer.instanceGreenOffset = -0.5;
  _valueLayer.transform = CATransform3DMakeRotation(M_PI*1.25, 0, 0, 1);
  _valueLayer.instanceTransform = CATransform3DMakeRotation(angle*0.75, 0.0, 0.0, 1.0);
  [self.layerContent.layer addSublayer:_valueLayer];

  CALayer *layer2 = [CALayer layer];
  layer2.frame = CGRectMake(100, 0, width, width*3);
  layer2.bounds = CGRectMake(0, 0, width, width*3);
  layer2.opacity = 1.0;
  layer2.backgroundColor = [UIColor redColor].CGColor;
  [_valueLayer addSublayer:layer2];
  
  
//  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//  
//  animation.fromValue = @(1.0);
//  animation.toValue = @(0);
//  animation.repeatCount = INT_MAX;
//  animation.duration = 1;
//  [layer addAnimation:animation forKey:nil];
}


- (IBAction)changeValue:(UISlider*)sender{
  _valueLayer.instanceCount = sender.value*count;
  persent = sender.value;
  _persentLabel.text = [NSString stringWithFormat:@"%.0f%%",persent*100];
}


@end
