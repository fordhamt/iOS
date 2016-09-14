//
//  AbilityViewController.m
//  finalProject
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "AbilityViewController.h"
#import "Hero.h"

@interface AbilityViewController ()

@end

@implementation AbilityViewController

@synthesize hero;
@synthesize heroAbility1;
@synthesize heroAbility2;
@synthesize heroAbility3;
@synthesize heroUlt1;
@synthesize heroUlt2;
@synthesize heroTrait;
@synthesize heroImgAb1;
@synthesize heroImgAb2;
@synthesize heroImgAb3;
@synthesize heroImgUlt1;
@synthesize heroImgUlt2;
@synthesize heroImgTrait;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = hero.name;
    self.heroAbility1.text = hero.ability1;
    self.heroAbility2.text = hero.ability2;
    self.heroAbility3.text = hero.ability3;
    self.heroTrait.text = hero.trait;
    self.heroUlt1.text = hero.ult1;
    self.heroUlt2.text = hero.ult2;
    
    self.heroImgTrait.image = [UIImage imageNamed:hero.imgtrait];
    self.heroImgAb3.image = [UIImage imageNamed:hero.imgab3];
    self.heroImgAb2.image = [UIImage imageNamed:hero.imgab2];
    self.heroImgAb1.image = [UIImage imageNamed:hero.imgab1];
    self.heroImgUlt2.image = [UIImage imageNamed:hero.imgult2];
    self.heroImgUlt1.image = [UIImage imageNamed:hero.imgult1];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
