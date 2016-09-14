//
//  TableViewController.m
//  assign4-redo
//
//  Created by Paul Fordham on 7/27/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(coords == nil)
        return 0;
    
    return coords.count;
}

-(void) setCoords:(NSArray *) coords_ {
    coords = [NSArray arrayWithArray:coords_];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary * coord =[coords objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString
                           stringWithFormat:@"Latitude:%@, Longitude:%@", [coord objectForKey:@"latitude"], [coord objectForKey:@"longitude"]];
    // Configure the cell...
    
    return cell;
}


-(IBAction) backtoStart:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
