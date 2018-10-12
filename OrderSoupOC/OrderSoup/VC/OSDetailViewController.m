//
//  OSDetailViewController.m
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/12.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import "OSDetailViewController.h"

@interface OSDetailViewController ()

@end

@implementation OSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
