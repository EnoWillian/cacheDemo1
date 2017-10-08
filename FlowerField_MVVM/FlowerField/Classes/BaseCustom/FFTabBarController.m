//
//  ILFTabBarController.m
//  iLife
//
//  Created by 郑佳 on 16/1/22.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "FFTabBarController.h"
#import "FFNavController.h"
#import "FFTabBarViewModel.h"
#import "public.h"

@implementation FFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self)
    [RACObserve(self, viewModel) subscribeNext:^(FFTabBarViewModel *viewModel) {
        @strongify(self)
        [self addChildViewControllerWithViewModel:viewModel.specialViewModel];
        [self addChildViewControllerWithViewModel:viewModel.authorViewModel];
        [self addChildViewControllerWithViewModel:viewModel.shopViewModel];
    }];

}

- (void)addChildViewControllerWithViewModel:(FFViewModel *)viewModel {

    Class vcClass = NSClassFromString(viewModel.viewcontroller);
    UIViewController *viewcontroller = [[vcClass alloc] initWithViewModel:viewModel];
    if (!viewcontroller) { return;}
    FFNavController *nav = [[FFNavController alloc]initWithRootViewController:viewcontroller];
    viewcontroller.navigationItem.title = viewModel.tabTitle;
    viewcontroller.tabBarItem.title = viewModel.tabTitle;
    viewcontroller.tabBarItem.image= [[UIImage imageNamed:viewModel.tabIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewcontroller.tabBarItem.selectedImage= [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",viewModel.tabIcon]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
    
}

@end
