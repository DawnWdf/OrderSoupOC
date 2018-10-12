//
//  OSOrder+intent.m
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/12.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import "OSOrder+intent.h"

@implementation OSOrder (intent)


- (OrderSoupIntent *)intent {
    OrderSoupIntent *resultIntent = [[OrderSoupIntent alloc] init];
    resultIntent.quantity = @(self.quantity);
    INObject *soupObject = [[INObject alloc] initWithIdentifier:self.soupMenuItem.soupShortcutNameKey displayString:self.soupMenuItem.name];
    resultIntent.soup = soupObject;
    
    resultIntent.options = self.options;
    
    [resultIntent setImage:[INImage imageNamed:self.soupMenuItem.imageName] forParameterNamed:self.soupMenuItem.soupShortcutNameKey] ;
    return resultIntent;
}

- (void)configOrderWith:(OrderSoupIntent *)intent {
    self.quantity = intent.quantity.integerValue;
    self.options = intent.options;
    
    OSSoup *soup = [[OSSoup alloc] init];
    soup.name = intent.soup.displayString;
    soup.soupShortcutNameKey = intent.soup.identifier;
    self.soupMenuItem = soup;
}
@end
