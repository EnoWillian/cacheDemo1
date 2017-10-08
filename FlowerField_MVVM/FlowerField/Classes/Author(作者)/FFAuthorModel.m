//
//  FFAuthorModel.m
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "FFAuthorModel.h"

@implementation FFAuthorModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"authorID":@"id"};
}

- (NSString *)authIconName {
    switch (self.newAuth) {
        case 1:
            return @"u_vip_yellow";
        case 2:
            return @"personAuth";
        default:
            return @"u_vip_blue";
    }
}


@end
