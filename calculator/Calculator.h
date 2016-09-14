//
//  ViewController.h
//  ios-group-fordham-project-1
//
//  Created by Paul Fordham on 5/29/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Compute.h"

@interface Calculator : UIViewController

@property(nonatomic, strong) Compute *comp;
@property(nonatomic, weak) NSString *operationUserHasPressed;
@property(strong, nonatomic) IBOutlet UITextView *display;
@property BOOL operandFinished;
@property BOOL resetDisplay;

-(IBAction) digitPressed:(UIButton *)sender;
-(IBAction) operationPressed: (UIButton *)sender;
-(IBAction) equalToSignPressed: (UIButton *)sender;

@end

