//
//  FFHomepageViewModel.h
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "FFViewModel.h"
#import "FFSpecialViewModel.h"
#import "FFAuthorViewModel.h"
#import "FFShopViewModel.h"

@interface FFTabBarViewModel : FFViewModel

/// 专题模块的veiw model
@property (nonatomic, strong) FFSpecialViewModel *specialViewModel;
/// 作者模块的view model
@property (nonatomic, strong) FFAuthorViewModel *authorViewModel;
/// 商城模块的view model
@property (nonatomic, strong) FFShopViewModel *shopViewModel;

@end
