//
//  BaseModel.h
//  FlowerField
//
//  Created by 郑佳 on 16/7/13.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFResponseModel : NSObject

/**
 提示信息
 */
@property (nonatomic, copy) NSString *msg;

/**
 返回的数据
 */
@property (nonatomic, strong) id result;

/**
  1 代表请求成功 0失败
 */
@property (nonatomic, assign) NSInteger status;

@end
