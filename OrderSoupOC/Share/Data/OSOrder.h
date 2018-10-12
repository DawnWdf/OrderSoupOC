//
//  OSOrder.h
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/11.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSSoup.h"

NS_ASSUME_NONNULL_BEGIN
/**
 订单model，list在订单历史里面
 */
@interface OSOrder : NSObject

//订单时间
@property (nonatomic, strong) NSDate *date;

//唯一标识
@property (nonatomic, strong) NSString *uuidString;

//汤品
@property (nonatomic, strong) OSSoup *soupMenuItem;

//数量
@property (nonatomic) NSInteger quantity;

//汤品选项，添加芝士什么的
@property (nonatomic, copy) NSString *options;
@end

NS_ASSUME_NONNULL_END
