//
//  TableViewController.m
//  LCY_VFLAutoLayout
//
//  Created by GuoBIn on 15/7/6.
//  Copyright (c) 2015年 薛国宾. All rights reserved.
//

#import "TableViewController.h"

#import "ViewController.h"

@interface TableViewController ()
{
    NSArray *listArray;
    NSNumber *indexNumber;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    listArray = @[@"example_1",@"example_2",@"example_3",@"example_4",@"example_5"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = listArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    indexNumber = [NSNumber numberWithInteger:indexPath.row];
    [self performSegueWithIdentifier:@"viewSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewSegue"]) {
        // segue.destinationViewController：获取连线时所指的界面（VC）
        ViewController *vc = segue.destinationViewController;
        vc.number = indexNumber;
    }
}

@end
