//
//  UIViewController+ViewModel.m
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "UIViewController+ViewModel.h"
#import <objc/runtime.h>

static char viewModelKey;
@implementation UIViewController (ViewModel)

- (instancetype)initWithViewModel:(id<FFViewModelProtocol>)viewModel {
    if (self = [self init]) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)setViewModel:(FFViewModel *)viewModel {
    objc_setAssociatedObject(self, &viewModelKey, viewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FFViewModel *)viewModel {
    return objc_getAssociatedObject(self, &viewModelKey);
}

@end
