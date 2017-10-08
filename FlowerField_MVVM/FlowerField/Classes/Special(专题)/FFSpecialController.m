//
//  FFSpecialController.m
//  FlowerField
//
//  Created by 郑佳 on 16/7/13.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "FFSpecialController.h"
#import "public.h"
#import "FFSpecialViewModel.h"
#import "UIViewController+ViewModel.h"
#import "FFTableView.h"
#import "FFRouter.h"
#import "FFAuthorDetailController.h"

@interface FFSpecialController ()

@property (nonatomic, strong) FFTableView *mainView;

@end

@implementation FFSpecialController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainView];
    [self handleData];
    
}

- (void)handleData {
    
    @weakify(self)
    [RACObserve(self, viewModel) subscribeNext:^(FFSpecialViewModel *viewModel) {
        @strongify(self)
        [self.mainView registerCellClass:viewModel.cellClass];
        [HUDTools zj_showLoadingInView:self.view];
        
        @weakify(self)
        [[viewModel.requestSpecialList execute:nil] subscribeNext:^(FFSpecialViewModel *viewModel) {
            @strongify(self)
            [HUDTools zj_hideInView:self.view];
            self.mainView.viewModel = viewModel;
            [self.mainView.tableView reloadData];
            
            for (FFSpecialViewModel *tempModel in viewModel.dataSource) {
                @weakify(self)
                [tempModel.headerClickSubject subscribeNext:^(id x) {
                    @strongify(self)
                    FFAuthorDetailController *vc = [[FFAuthorDetailController alloc] initWithViewModel:nil];
                    [self.navigationController pushViewController:vc animated:YES];
                }];
            }
        } error:^(NSError *error) {
            [HUDTools zj_showErrorStatusInView:self.view title:@"Request Error!"];
        }];
        
        [viewModel.didSelectSubject subscribeNext:^(id x) {
            @strongify(self)
            UIViewController *controller = [[FFRouter sharedInstance] controllerForViewModel:x];
            [self.navigationController pushViewController:controller animated:YES];
        }];
        
    }];
}

- (FFTableView *)mainView {
    if (_mainView == nil) {
        _mainView = [[FFTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    }
    return _mainView;
}


@end
