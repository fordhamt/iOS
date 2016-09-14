//
//  TalentViewController.m
//  finalProject
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "TalentViewController.h"
#import "Hero.h"

@interface TalentViewController ()

@end

@implementation TalentViewController

@synthesize hero;
@synthesize heroTalents;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.heroTalents = hero.talentsArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* talentTableID = @"talentCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:talentTableID];
    
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:talentTableID];
    
    NSString *talent = [self.heroTalents objectAtIndex:indexPath.row];
    cell.textLabel.text = talent;
    
    return cell;
}

// return planet array size for table
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.heroTalents count];
}

@end
