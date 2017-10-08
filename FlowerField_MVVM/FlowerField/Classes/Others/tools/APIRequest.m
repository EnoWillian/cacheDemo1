//
//  APIManager.m
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "APIRequest.h"
#import "NetworkHelper.h"
#import "FFConst.h"
#import <MJExtension/MJExtension.h>
#import "DBManager.h"
#import "FFHelper.h"

@implementation APIRequest

+ (instancetype)sharedManager {
    static APIRequest *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[APIRequest alloc]init];
    });
    return _instance;
}

/// 首页专题列表
- (void)requestSpecialListFinishBlock:(void (^)(id, NSError *))finishBlock {

    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"currentPageIndex"] = @0;
    params[@"pageSize"] = @(kPageSize);
    params[@"isCache666"] = @(YES);
    [self requestMethod:POST url:@"http://m.htxq.net/servlet/SysArticleServlet?action=mainList" parameters:params.copy finishBlock:^(id data, NSError *error) {
        finishBlock(data,error);
    }];
}

/// 作者列表
- (void)requestAuthorListFinishBlock:(void (^)(id, NSError *))finishBlock {
    
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"action"] = @"topArticleAuthor";
//    params[@"isCache666"] = @(YES);
    
    [self requestMethod:POST url:@"http://ec.htxq.net/servlet/SysArticleServlet?currentPageIndex=0&pageSize=10" parameters:params.copy finishBlock:^(id data, NSError *error) {
        finishBlock(data,error);
    }];
}

- (void)requestMethod:(NSString *)method url:(NSString *)url parameters:(NSMutableDictionary *)params finishBlock:(void (^)(id data, NSError *error))finishBlock {
    
    NSString *cacheKey = [FFHelper connectBaseUrl:url params:params];
    BOOL isCache = [cacheKey containsString:@"isCache666"];
    
    [[NetworkHelper sharedInstance] requestMethod:method url:url parameters:params finishBlock:^(id data, NSError *error) {

        if (error) {
            id cacheData = [[DBManager sharedManager] itemWithCacheKey:cacheKey];
            FFResponseModel *model = [FFResponseModel mj_objectWithKeyValues:cacheData];
            if (!model) {
                finishBlock(nil,error);
            } else {
                finishBlock(model,nil);
            }
            return ;
        }
        
        FFResponseModel *model = [FFResponseModel mj_objectWithKeyValues:data];
        finishBlock(model,nil);
        if (isCache) {
            // 缓存json格式的data
            [[DBManager sharedManager] insertItem:data cacheKey:cacheKey];
        }
    }];
}

@end
