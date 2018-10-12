//
//  OSSiriAuthorizationManager.h
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/10.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Intents/Intents.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSSiriAuthorizationManager : NSObject

/**
 Siri授权提示框

 @return 授权状态
 */
+ (INSiriAuthorizationStatus)os_siriAuthorizationStatus;


/**
 因为用户可以在任意时刻通过设置修改Siri权限，所以在使用Siri之前，最好重新获取一下状态并给出提示。这里可以放置一些业务逻辑处理。

 @return 授权状态
 */
+ (INSiriAuthorizationStatus)os_checkSiriAuthorizationStatus ;

@end

NS_ASSUME_NONNULL_END
