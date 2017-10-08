//
//  UIView+FFAdd.m
//  FlowerField
//
//  Created by kepuna on 2017/8/24.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "UIView+FFAdd.h"
#import <objc/runtime.h>

static char viewModelKey;

@implementation UIView (FFAdd)

- (void)setViewModel:(FFViewModel *)viewModel {
    objc_setAssociatedObject(self, &viewModelKey, viewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FFViewModel *)viewModel {
   return objc_getAssociatedObject(self, &viewModelKey); 
}

@end
