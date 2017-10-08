//
//  CLFBaseNavController.m
//  CityLife
//
//  Created by 郑佳 on 16/6/22.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "FFNavController.h"
#import "public.h"

@implementation FFNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE_16],
       NSForegroundColorAttributeName:[UIColor darkGrayColor]}];
    self.navigationBar.barTintColor = kNavBarTintColor;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count) { // not root vc
        viewController.hidesBottomBarWhenPushed = YES;
        [self setBackItem:viewController];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)setBackItem:(UIViewController *)vc{
    self.interactivePopGestureRecognizer.delegate = nil;
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(s_backAction)];
    vc.navigationItem.leftBarButtonItem = back;
}

- (void)s_backAction{
    
    if (self.presentingViewController != nil){
        [self dismissViewControllerAnimated:NO completion:nil];
    } else{
        [self popViewControllerAnimated:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
