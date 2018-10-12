//
//  OrderSoupIntentManager.m
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/11.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import "OrderSoupIntentManager.h"


#import "OrderSoupIntent.h"

@implementation OrderSoupIntentManager

+ (instancetype)shareManager {
    static OrderSoupIntentManager *manager ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[OrderSoupIntentManager alloc] init];
    });
    return manager;
}



/**
 donate一个捷径
 根据order生成一个intent，然后根据 intent生成一个捷径并donate

 //以下为官方文档
 To donate the intent, create an instance of the intent class. Set its parameter values and add images to the parameters as needed. To recommend a voice phrase that the user may want to add to Siri, set the intent’s suggestedInvocationPhrase property to a string containing the phrase.
 After creating the intent, create an instance of INInteraction and call its donateInteractionWithCompletion: method, passing in the intent. This tells Siri about the shortcut.

 @param order 订单详细信息
 */
- (void)donateShortcutWith:(OSOrder *)order {
    //创建一个intent,并给对应的参数赋值
    OrderSoupIntent *osIntent = [[OrderSoupIntent alloc] init];
    osIntent.quantity = @(order.quantity);
    INObject *soupObject = [[INObject alloc] initWithIdentifier:order.soupMenuItem.soupShortcutNameKey displayString:order.soupMenuItem.name];
    osIntent.soup = soupObject;
 
    osIntent.options = order.options;
    
    [osIntent setImage:[INImage imageNamed:@"box-1"] forParameterNamed:order.soupMenuItem.soupShortcutNameKey] ;
    osIntent.suggestedInvocationPhrase = @"来一碗鸡蛋汤";
    
    //创建interaction并donate此intent
    
    INInteraction *interaction = [[INInteraction alloc] initWithIntent:osIntent response:nil];
    [interaction donateInteractionWithCompletion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",error.description);
        }else{
            NSLog(@"donate成功");
        }
    }];
    
}
@end
