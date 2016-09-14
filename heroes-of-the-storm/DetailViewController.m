//
//  DetailViewController.m
//  finalProject
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "DetailViewController.h"
#import "Hero.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize hero;
@synthesize heroPic;
@synthesize heroInfo;
@synthesize heroWinRate;
@synthesize heroType;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = hero.name;
    self.heroPic.image = [UIImage imageNamed:hero.imageFile];
    //self.heroName.text = hero.name;
    self.heroInfo.text = hero.info;
    self.heroType.text = hero.type;
    self.heroWinRate.text = hero.winRate;
    self.heroPrice.text = hero.price;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// segway method
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showHeroAbility"]) {
        AbilityViewController *vc = [segue destinationViewController];
    
        [vc setHero:hero];
    }
    if([segue.identifier isEqualToString:@"showHeroStats"]) {
        StatsViewController *vc = [segue destinationViewController];
        
        [vc setHero:hero];
    }
    if([segue.identifier isEqualToString:@"showHeroTalents"]) {
        TalentViewController *vc = [segue destinationViewController];
        
        [vc setHero:hero];
    }}


@end
