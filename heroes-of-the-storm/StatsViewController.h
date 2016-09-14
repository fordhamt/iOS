//
//  StatsViewController.h
//  finalProject
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"

@interface StatsViewController : UIViewController

@property IBOutlet UITextField *heroHp;
@property IBOutlet UITextField *heroHpRegen;
@property IBOutlet UITextField *heroMana;
@property IBOutlet UITextField *heroManaRegen;
@property IBOutlet UITextField *heroRange;
@property IBOutlet UITextField *heroAts;
@property IBOutlet UITextField *heroDamage;

@property IBOutlet UITextField *heroMaxHp;
@property IBOutlet UITextField *heroRegenPer;
@property IBOutlet UITextField *heroDamagePer;

@property Hero* hero;
@end
