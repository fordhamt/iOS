//
//  DetailViewController.h
//  finalProject
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbilityViewController.h"
#import "StatsViewController.h"
#import "TalentViewController.h"

#import "Hero.h"

@interface DetailViewController : UIViewController

@property IBOutlet UIImageView *heroPic;
@property IBOutlet UITextField *heroWinRate;
@property IBOutlet UITextField *heroType;
@property IBOutlet UITextView *heroInfo;
@property IBOutlet UITextField *heroPrice;

@property IBOutlet UIButton* viewAbilities;
@property IBOutlet UIButton* viewStats;
@property IBOutlet UIButton* viewTalents;

@property Hero* hero;

@end
