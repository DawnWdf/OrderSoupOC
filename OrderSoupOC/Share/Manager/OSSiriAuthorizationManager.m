//
//  OSSiriAuthorizationManager.m
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/10.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import "OSSiriAuthorizationManager.h"

@implementation OSSiriAuthorizationManager

+ (INSiriAuthorizationStatus)os_siriAuthorizationStatus {
    if (@available(iOS 10.0, *)) {
       __block  INSiriAuthorizationStatus statusResult = [INPreferences siriAuthorizationStatus];
        
        [INPreferences requestSiriAuthorization:^(INSiriAuthorizationStatus status) {
            statusResult = status;
            switch (status) {
                case INSiriAuthorizationStatusNotDetermined:
                    NSLog(@"用户尚未对该应用程序作出选择。");
                    break;
                case INSiriAuthorizationStatusRestricted:
                    NSLog(@"此应用程序无权使用Siri服务");
                    break;
                case INSiriAuthorizationStatusDenied:
                    NSLog(@"用户已明确拒绝此应用程序的授权");
                    break;
                case INSiriAuthorizationStatusAuthorized:
                    NSLog(@"用户可以使用此应用程序的授权");
                    break;
                default:
                    break;
            }
            
        }];
        return statusResult;
    }
    return 0;
}

+ (INSiriAuthorizationStatus)os_checkSiriAuthorizationStatus {
    if (@available(iOS 10.0, *)) {
        INSiriAuthorizationStatus status = [INPreferences siriAuthorizationStatus];
        switch (status) {
            case INSiriAuthorizationStatusNotDetermined:
                NSLog(@"用户尚未对该应用程序作出选择。");
                break;
            case INSiriAuthorizationStatusRestricted:
                NSLog(@"此应用程序无权使用Siri服务");
                break;
            case INSiriAuthorizationStatusDenied:
                NSLog(@"用户已明确拒绝此应用程序的授权");
                break;
            case INSiriAuthorizationStatusAuthorized:
                NSLog(@"用户可以使用此应用程序的授权");
                break;
            default:
                break;
        }
        return status;
    }
    return 0;
}
@end
