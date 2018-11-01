//
//  OrderSoupIntentManager.h
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/11.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSOrder.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderSoupIntentManager : NSObject

+ (instancetype)orderSoupIntent;
/**
 donate一个捷径
 根据order生成一个intent，然后根据 intent生成一个捷径并donate
 
 @param order 订单详细信息
 */
- (void)donateShortcutWith:(OSOrder *)order ;

@end

NS_ASSUME_NONNULL_END
