//
//  FFViewModel.h
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "FFViewModelProtocol.h"

@interface FFViewModel : NSObject<FFViewModelProtocol>

@property (nonatomic, copy) NSDictionary *params;
@property (nonatomic, copy) NSString *navTitle;
@property (nonatomic, copy) NSString *tabTitle;
@property (nonatomic, copy) NSString *tabIcon;
@property (nonatomic, copy) NSString *viewcontroller;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) RACSubject *didSelectSubject;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
