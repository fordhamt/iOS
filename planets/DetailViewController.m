//
//  DetailViewController.m
//  planets
//
//  Created by Paul Fordham on 6/17/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize planet;
@synthesize planetPic;
@synthesize planetInfo;
@synthesize planetNum;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = planet.name;
    self.planetPic.image = [UIImage imageNamed:planet.imageFile];
    self.planetInfo.text = planet.info;
    self.planetNum.text = planet.planetNum;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
