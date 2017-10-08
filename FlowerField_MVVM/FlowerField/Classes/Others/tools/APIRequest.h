//
//  APIManager.h
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFResponseModel.h"

@interface APIRequest : NSObject

+ (instancetype)sharedManager;

/// 首页专题列表
- (void)requestSpecialListFinishBlock:(void (^)(id data, NSError *error))finishBlock;
/// 作者列表
- (void)requestAuthorListFinishBlock:(void (^)(id data, NSError *error))finishBlock;


@end
