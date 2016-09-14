//
//  AbilityViewController.h
//  finalProject
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"

@interface AbilityViewController : UIViewController

@property IBOutlet UITextView *heroAbility1;
@property IBOutlet UITextView *heroAbility2;
@property IBOutlet UITextView *heroAbility3;
@property IBOutlet UITextView *heroUlt1;
@property IBOutlet UITextView *heroUlt2;

@property IBOutlet UITextView *heroTrait;
@property IBOutlet UIImageView *heroImgAb1;
@property IBOutlet UIImageView *heroImgAb2;
@property IBOutlet UIImageView *heroImgAb3;
@property IBOutlet UIImageView *heroImgUlt1;
@property IBOutlet UIImageView *heroImgUlt2;
@property IBOutlet UIImageView *heroImgTrait;
//@property IBOutlet UITextView *heroMount;


@property Hero* hero;


@end
