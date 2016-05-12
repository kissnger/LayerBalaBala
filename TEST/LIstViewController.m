//
//  LIstViewController.m
//  TEST
//
//  Created by Massimo on 16/5/12.
//  Copyright © 2016年 Massimo. All rights reserved.
//

#import "LIstViewController.h"
@interface LIstViewController()
@property (nonatomic, copy) NSArray *data;

@end
@implementation LIstViewController
- (void)viewDidLoad{
  [super viewDidLoad];
  _data = @[@"MYViewController",
            @"LayerViewController",
            @"ReplicatorLayerViewController",
            @"ShareLayerViewController",
            @"AnimationViewController"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return _data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  cell.textLabel.text = _data[indexPath.row];
  return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
  UIViewController *vc = [sb instantiateViewControllerWithIdentifier:_data[indexPath.row]];
  [self.navigationController pushViewController:vc animated:YES];
}

@end
