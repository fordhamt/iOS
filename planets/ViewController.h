//
//  ViewController.h
//  planets
//
//  Created by Paul Fordham on 6/17/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "Planets.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) IBOutlet UITableView *tableView;


@end

