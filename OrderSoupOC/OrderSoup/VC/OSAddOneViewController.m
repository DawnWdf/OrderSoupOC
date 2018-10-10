//
//  OSAddOneViewController.m
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/9.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import "OSAddOneViewController.h"
//#import <Intents/Intents.h>

@interface OSAddOneViewController ()

@property (nonatomic, strong) NSUserActivity *customUserActivity;

@end

@implementation OSAddOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatingAUserActivityObject];
}
- (IBAction)doneWithVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)creatingAUserActivityObject {
    //1.Create and initialize the user activity object with an appropriate activity type. (You define the activity types your app supports.)
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:@"com.orderSoupOC.createAUserActivity"];

    //2.Set the title of the user activity object.
    userActivity.title = @"userActivity的标题";
    
    //3.Configure the tasks for which the object is eligible by enabling one or more of the following properties:
    /*
    eligibleForHandoff
    eligibleForSearch
    eligibleForPublicIndexing
     */
    if (@available(iOS 9.0,*)) {
        userActivity.eligibleForSearch = YES;//是否支持spoilt搜索
        userActivity.eligibleForHandoff = YES;//是否支持设备间握手
        userActivity.eligibleForPublicIndexing = YES;//是否支持云搜索
    }
    if (@available(iOS 12.0 ,*)) {
        userActivity.eligibleForPrediction = YES;
        userActivity.persistentIdentifier = @"userActivity_persistentIdentifier";
    }
    
    //4.Configure the properties of this object that relate to the user’s current activity.
    userActivity.userInfo = @{@"key_ua":@"巴拉巴拉小魔仙"};//这里最好放置有关的所有参数，这样有利于接收userActivityi信息后还原
    userActivity.needsSave = YES;
    
    //5.For user activity objects configured for search or public indexing, configure the contentAttributeSet, keywords, or webpageURL properties so that Spotlight can index the object.
    userActivity.keywords = [NSSet setWithObjects:@"巴拉",@"小魔仙",@"123", nil];
    userActivity.webpageURL = [NSURL URLWithString:@"https://www.baidu.com"];
//    userActivity.suggestedInvocationPhrase = @"";
    
    //6.Call the becomeCurrent method to register the user activity object with the system.
    [userActivity becomeCurrent];
    
    //tips;Important<Your app must maintain a strong reference to any activity objects that you use for search results.>
    self.customUserActivity = userActivity;
    
    /*
     想要搜索的时候有更多细节，引入
     #import <CoreSpotlight/CoreSpotlight.h>
     进行如下设置
     CSSearchableItemAttributeSet * attributes = [[CSSearchableItemAttributeSet alloc] init];
     UIImage *icon = [UIImage imageNamed:@"xwz"];
     attributes.thumbnailData = UIImagePNGRepresentation(icon);
     attributes.contentDescription = @"attributes.contentDescription";
     userActivity.contentAttributeSet = attributes;
     */
}
@end
