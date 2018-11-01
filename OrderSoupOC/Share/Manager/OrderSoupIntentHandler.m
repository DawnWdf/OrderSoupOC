//
//  OrderSoupIntentHandler.m
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/10.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import "OrderSoupIntentHandler.h"
#import "OrderSoupIntent.h"

@implementation OrderSoupIntentHandler

- (void)handleOrderSoup:(OrderSoupIntent *)intent completion:(void (^)(OrderSoupIntentResponse *response))completion NS_SWIFT_NAME(handle(intent:completion:)) {
    //NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:@"OrderSoupIntent"];
    
    OrderSoupIntentResponse *response = [OrderSoupIntentResponse successIntentResponseWithSoup:intent.soup waitTime:@"10分钟"];// [[OrderSoupIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeSuccess userActivity:userActivity];
    response.soup = intent.soup;
    response.waitTime = @"10分钟";
    //预定一份汤的处理
    completion(response);
}



- (void)confirmOrderSoup:(OrderSoupIntent *)intent completion:(void (^)(OrderSoupIntentResponse *response))completion NS_SWIFT_NAME(confirm(intent:completion:)) {
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:@"OrderSoupIntent"];
    OrderSoupIntentResponse *response = [[OrderSoupIntentResponse alloc] initWithCode:OrderSoupIntentResponseCodeReady userActivity:userActivity];
    completion(response);
}
@end
