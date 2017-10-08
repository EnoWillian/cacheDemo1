//
//  FFAuthorViewModel.m
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "FFAuthorViewModel.h"
#import "FFAuthorModel.h"
#import "public.h"

@implementation FFAuthorViewModel

- (instancetype)initWithModel:(FFAuthorModel *)model {
    
    if (self = [super init]) {
        
        RAC(self,headImg) = RACObserve(model, headImg);
        RAC(self,userName) = RACObserve(model, userName);
        RAC(self,authIconName) = RACObserve(model, authIconName);
    }
    return self;
}

- (RACCommand *)requestAuthorList {
    
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [[APIRequest sharedManager] requestAuthorListFinishBlock:^(FFResponseModel *model, NSError *error) {
                if(error) {
                    [subscriber sendError:error];
                } else {
                    NSMutableArray *tempArray = [NSMutableArray array];
                    [model.result enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
                        FFAuthorModel *tempModel = [FFAuthorModel mj_objectWithKeyValues:dict];
                        FFAuthorViewModel *viewModel = [[FFAuthorViewModel alloc] initWithModel:tempModel];
                        viewModel.sortNum = [NSString stringWithFormat:@"%zd",idx + 1];
                        viewModel.goodTopicClickSubject = [RACSubject subject];
                        [tempArray addObject:viewModel];
                    }];
                    self.dataSource = tempArray;
                    [subscriber sendNext:self];
                    [subscriber sendCompleted];
                }
            }];
            return nil;
        }];
    }];
}

- (Class)cellClass {
    return NSClassFromString(@"FFAuthorCell");
}



@end
