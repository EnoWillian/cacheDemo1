//
//  FFSpecialViewModel.m
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "FFSpecialViewModel.h"
#import "FFSpecialModel.h"
#import "public.h"

@implementation FFSpecialViewModel

- (instancetype)initWithModel:(FFSpecialModel *)model {
    if (self = [super init]) {
        
        RAC(self,smallIcon) = RACObserve(model, smallIcon);
        RAC(self,headImg) = RACObserve(model.author, headImg);
        RAC(self,userName) = RACObserve(model.author, userName);
        RAC(self,authorIdentity) = RACObserve(model.author, identity);
        RAC(self,desc) = RACObserve(model, desc);
        RAC(self,title) = RACObserve(model, title);
        RAC(self,categoryName) = [RACObserve(model.category, name) map:^id(id value) {
            return [NSString stringWithFormat:@"[ %@ ]",value];
        }];
        RAC(self,authIconName) = RACObserve(model.author, authIconName);
        RAC(self,readNum) = RACObserve(model, read);
        RAC(self,commentNum) = RACObserve(model, fnCommentNum);
        RAC(self,followNum) = RACObserve(model, favo);
   
    }
    return self;
}

- (RACCommand *)requestSpecialList {
    
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [[APIRequest sharedManager] requestSpecialListFinishBlock:^(FFResponseModel *model, NSError *error) {
                if(error) {
                    [subscriber sendError:error];
                } else {
                    NSMutableArray *tempArray = [NSMutableArray array];
                    for (NSDictionary *dict in model.result) {
                        FFSpecialModel *tempModel = [FFSpecialModel mj_objectWithKeyValues:dict];
                        FFSpecialViewModel *cellModel = [[FFSpecialViewModel alloc] initWithModel:tempModel];
                        cellModel.headerClickSubject = [RACSubject subject];
                        [tempArray addObject:cellModel];
                    }
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
    return NSClassFromString(@"FFSpecialCell");
}

@end
