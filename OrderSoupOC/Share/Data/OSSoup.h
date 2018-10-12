//
//  OSSoup.h
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/11.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 汤品model
 */
@interface OSSoup : NSObject

//唯一标识
@property (nonatomic, copy) NSString *soupShortcutNameKey;
//汤品名称
@property (nonatomic, copy) NSString *name;
//汤品图片
@property (nonatomic, copy) NSString *imageName;
//汤品价格
@property (nonatomic) float price;
//汤品是否可以预定
@property (nonatomic) BOOL isAvailabel;
//汤品是否为每日特价
@property (nonatomic) BOOL isDailySpecial;

@end

NS_ASSUME_NONNULL_END
