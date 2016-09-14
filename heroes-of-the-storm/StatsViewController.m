//
//  StatsViewController.m
//  finalProject
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "StatsViewController.h"
#import "Hero.h"

@interface StatsViewController ()

@end

@implementation StatsViewController

@synthesize hero;
@synthesize heroHp;
@synthesize heroHpRegen;
@synthesize heroMana;
@synthesize heroManaRegen;
@synthesize heroAts;
@synthesize heroRange;
@synthesize heroDamage;

@synthesize heroMaxHp;
@synthesize heroRegenPer;
@synthesize heroDamagePer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = hero.name;

    self.heroHp.text = hero.hp;
    self.heroHpRegen.text = hero.hpRegen;
    self.heroMana.text = hero.mana;
    self.heroManaRegen.text = hero.manaRegen;
    self.heroAts.text = hero.ats;
    self.heroRange.text = hero.range;
    self.heroDamage.text = hero.damage;
    
    self.heroMaxHp.text = hero.maxhp;
    self.heroRegenPer.text = hero.regenper;
    self.heroDamagePer.text = hero.damageper;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
