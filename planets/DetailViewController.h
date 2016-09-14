//
//  DetailViewController.h
//  planets
//
//  Created by Paul Fordham on 6/17/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Planets.h"

@interface DetailViewController : UIViewController

@property(weak, nonatomic) IBOutlet UIImageView *planetPic;
@property(weak, nonatomic) IBOutlet UITextView *planetInfo;

@property(weak, nonatomic) IBOutlet UITextField *planetNum;

@property(strong,nonatomic) Planets* planet;
@end
