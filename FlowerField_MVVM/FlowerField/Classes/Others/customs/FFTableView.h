//
//  FFTableView.h
//  FlowerField
//
//  Created by kepuna on 2017/8/23.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFTableView : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
/// init method
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
/// class for 'cell'
- (void)registerCellClass:(Class)cellClass;

@end
