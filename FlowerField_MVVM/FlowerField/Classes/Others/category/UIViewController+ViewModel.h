//
//  UIViewController+ViewModel.h
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFViewControllerProtocol.h"
#import "FFViewModel.h"

@interface UIViewController (ViewModel) <FFViewControllerProtocol>

@property (nonatomic, strong) FFViewModel *viewModel;
- (instancetype)initWithViewModel:(id<FFViewModelProtocol>)viewModel;

@end
