//
//  MYViewController.m
//  TEST
//
//  Created by Massimo on 16/4/22.
//  Copyright © 2016年 Massimo. All rights reserved.
//

#import "MYViewController.h"
//#import "ReactCocoa.swift"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface Model:NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *count;
@end

@implementation Model
- (instancetype)initWith:(NSString*)name count:(NSString*)count{
  self = [super init];
  if (self) {
    self.name = name;
    self.count = count;
    
//    [[[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] startWith:[NSDate date]] subscribeNext:^(id x) {
//      int count = [self.count intValue];
//      
//      NSLog(@"currentThread  ----  %@ ---- %@",[NSThread currentThread],self);
//      self.count = [NSString stringWithFormat:@"%d",--count];
//    }];
  }
  
  return self;
}

@end


@interface MYViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic, copy) NSMutableArray *dataArray;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation MYViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  _dataArray = @[].mutableCopy;
  _tableView.delegate = self;
  _tableView.dataSource = self;
  
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  [self modelWith:@"a" count:@"2200"];
  [self modelWith:@"b" count:@"300"];
  [self modelWith:@"c" count:@"400"];
  [self modelWith:@"d" count:@"500"];
  [self modelWith:@"e" count:@"6600"];
  _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
  dispatch_source_set_timer(_timer,DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0);
  dispatch_source_set_event_handler(_timer, ^{
    [self countDown];
  });
  
  dispatch_resume(_timer);
 
  
  
}

- (void)modelWith:(NSString*)name count:(NSString*)count{
  Model *model = [[Model alloc]initWith:name count:count];

  [self.dataArray addObject:model];
}

- (void)countDown{
  
  for (Model *model in _dataArray) {
    dispatch_async(dispatch_get_main_queue(), ^{
      int count = [model.count intValue];
      model.count = [NSString stringWithFormat:@"%d",--count];
    });
  }
  
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  Model *model = _dataArray[indexPath.row];
  cell.textLabel.text = model.name;
  RAC(cell.detailTextLabel,text) = [RACObserve(model, count) takeUntil:[cell rac_prepareForReuseSignal]];
  
  
  
  return cell;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
