//
//  UITableViewCell+FFAdd.h
//  FlowerField
//
//  Created by kepuna on 2017/8/24.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFViewModel.h"

@interface UITableViewCell (FFAdd)

@property (nonatomic, strong) FFViewModel *cellModel;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end
