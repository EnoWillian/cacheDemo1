//
//  FFAuthorViewModel.h
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "FFViewModel.h"

@interface FFAuthorViewModel : FFViewModel<FFViewModelProtocol>

- (RACCommand *)requestAuthorList;

/// 头像
@property (nonatomic, copy) NSString *headImg;
/// 用户名
@property (nonatomic, copy) NSString *userName;
/// 认证小图标
@property (nonatomic, copy) NSString *authIconName;
/// 排行
@property (nonatomic, copy) NSString *sortNum;
/// cell对应class
@property (nonatomic, strong) Class cellClass;
/// 擅长话题的点击事件
@property (nonatomic, strong) RACSubject *goodTopicClickSubject;

@end
