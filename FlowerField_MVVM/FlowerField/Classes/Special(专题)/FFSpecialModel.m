//
//  FFArticleModel.m
//  FlowerField
//
//  Created by 郑佳 on 16/7/14.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "FFSpecialModel.h"
#import "public.h"

@implementation FFCategoryModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"categoryID":@"id"};
}

@end

@implementation FFSpecialModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"articleID":@"id"};
}

@end
