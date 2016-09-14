//
//  ViewController.m
//  assignment-3-ios
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "ViewController.h"
#import "AddGroceryViewController.h"
#import "Grocery.h"

@interface ViewController ()

@property NSMutableArray *groceries;

@end

@implementation ViewController

- (IBAction)unwindToTable:(UIStoryboardSegue *)segue {
    AddGroceryViewController *source = [segue sourceViewController];
    Grocery *item = source.grocery;
    if (item != nil) {
        [self.groceries addObject:item];
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    Grocery *tappedItem = [self.groceries objectAtIndex:indexPath.row];
    tappedItem.inCart = !tappedItem.inCart;
    [tableView reloadRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationNone];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.groceries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"prototypeCell" forIndexPath:indexPath];
    
    Grocery *groceryItem = [self.groceries objectAtIndex:indexPath.row];
    cell.textLabel.text = groceryItem.groceryName;
    
    if (groceryItem.inCart)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.groceries = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
