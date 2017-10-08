//
//  FFRouter.m
//  FlowerField
//
//  Created by kepuna on 2017/8/25.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "FFRouter.h"
#import "UIViewController+ViewModel.h"

@interface FFRouter ()

@property (nonatomic, copy) NSDictionary *mappingDict; // viewModel到view的映射

@end

@implementation FFRouter

+ (instancetype)sharedInstance {
    static FFRouter *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[FFRouter alloc]init];
    });
    return _instance;
}

- (UIViewController *)controllerForViewModel:(FFViewModel *)viewModel {
    NSString *controller = self.mappingDict[NSStringFromClass(viewModel.class)];
    NSParameterAssert([NSClassFromString(controller) isSubclassOfClass:[UIViewController class]]);
    NSParameterAssert([NSClassFromString(controller) instancesRespondToSelector:@selector(initWithViewModel:)]);
    return [[NSClassFromString(controller) alloc] initWithViewModel:viewModel];
}

- (NSDictionary *)mappingDict {
    return @{
             @"FFSpecialViewModel":@"FFSpecialDetailController",
             @"FFAuthorViewModel":@"FFAuthorDetailController"
             };
}

@end
