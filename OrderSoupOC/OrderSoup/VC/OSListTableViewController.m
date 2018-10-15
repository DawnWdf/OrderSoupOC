//
//  OSListTableViewController.m
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/9.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import "OSListTableViewController.h"
#import <OrderSoupKit/OrderSoupKit.h>

@interface OSListTableViewController ()

@property (nonatomic, strong) NSArray *historyLists;

@end

@implementation OSListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.historyLists = [self cachHistoryData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.historyLists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    OSOrder *order = [self.historyLists objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:order.soupMenuItem.imageName];

    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld份%@，配%@的",(long)order.quantity,order.soupMenuItem.name,order.options.description];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OSOrder *order = [self.historyLists objectAtIndex:indexPath.row];

    [[OrderSoupIntentManager shareManager] donateShortcutWith:order];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSArray *)cachHistoryData {
    OSOrder *order = [[OSOrder alloc] init];
    order.quantity = 1;
    OSSoup *soup = [[OSSoup alloc] init];
    soup.imageName = @"box-1";
    soup.name = @"鸡蛋汤";
    soup.price = 3.5;
    soup.isAvailabel = YES;
    soup.isDailySpecial = YES;
    soup.soupShortcutNameKey = @"蛋花汤";
    order.soupMenuItem = soup;
    order.options = @"西红柿";
    order.uuidString = @"订单的唯一标识";
    return @[order];
}
@end
