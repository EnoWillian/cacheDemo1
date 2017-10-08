//
//  FFRouter.h
//  FlowerField
//
//  Created by kepuna on 2017/8/25.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FFViewModel.h"

@interface FFRouter : NSObject

/// 返回一个单例的实例
+ (instancetype)sharedInstance;
/// 返回和viewModel映射的congroller
- (UIViewController *)controllerForViewModel:(FFViewModel *)viewModel;

@end
