//
//  IntentViewController.m
//  OrderSoupExtensionUI
//
//  Created by Dawn Wang on 2018/10/12.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import "IntentViewController.h"

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

@interface IntentViewController ()

@end

@implementation IntentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - INUIHostedViewControlling
- (void)configureWithInteraction:(INInteraction *)interaction context:(INUIHostedViewContext)context completion:(void (^)(CGSize desiredSize))completion {
    if (completion) {
        completion(CGSizeMake([self desiredSize].width, 200));
    }
}

// Prepare your view controller for the interaction to handle.
- (void)configureViewForParameters:(NSSet <INParameter *> *)parameters ofInteraction:(INInteraction *)interaction interactiveBehavior:(INUIInteractiveBehavior)interactiveBehavior context:(INUIHostedViewContext)context completion:(void (^)(BOOL success, NSSet <INParameter *> *configuredParameters, CGSize desiredSize))completion {
    // Do configuration here, including preparing views and calculating a desired size for presentation.
    
    if (completion) {
        completion(YES, parameters, CGSizeMake([self desiredSize].width, 200));
    }
}

- (CGSize)desiredSize {
    return [self extensionContext].hostedViewMaximumAllowedSize;
}

@end
