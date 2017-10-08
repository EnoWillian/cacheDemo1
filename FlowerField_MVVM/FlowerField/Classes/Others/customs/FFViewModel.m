//
//  FFViewModel.m
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "FFViewModel.h"

@implementation FFViewModel

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.params = params;
        self.navTitle = params[@"tabTitle"];
        self.tabTitle = params[@"tabTitle"];
        self.tabIcon = params[@"tabIcon"];
        self.viewcontroller = params[@"viewcontroller"];
        self.dataSource = @[].mutableCopy;
        self.didSelectSubject = [RACSubject subject];
    }
    return self;
}

@end
