//
//  ViewController.m
//  ios-group-fordham-project-1
//
//  Created by Paul Fordham on 5/29/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "Calculator.h"

@interface Calculator ()

@end

@implementation Calculator
- (IBAction) digitPressed: (UIButton *)sender {
    // to obtain number entered by user
    NSString *numberEntered = sender.currentTitle;
    
    // insert your code below
    
    // check if display is empty
    if([_display.text isEqual:@"0"] || self.resetDisplay) {
        self.resetDisplay = NO;
        _display.text = @"";
    }
    
    // update the display
    _display.text = [NSString stringWithFormat:@"%@%@", _display.text, numberEntered];
}

- (IBAction) operationPressed: (UIButton *)sender {
    // obtain operation entered by user
    self.operationUserHasPressed = sender.currentTitle;
    
    // insert your code here
    
    // store last number entered
    [self storeNumber];
    
    // update display
    self.resetDisplay = YES;
}

- (IBAction) equalToSignPressed: (UIButton *)sender {
    // to obtain the result of the computation
    double result = 0;
    [self.comp pushOperand:[_display.text doubleValue]];
    result = [self.comp performOperation: self.operationUserHasPressed];
    
    // insert your code here
    // store result as first operand
    [self.comp pushOperand: result];
    
    //to display correct places after decimal place
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setUsesSignificantDigits:YES];
    [formatter setMinimumSignificantDigits:1];
    
    //converting back to a string from a double
    NSNumber *num = [NSNumber numberWithDouble: result];
    NSString *numToString = [formatter stringFromNumber: num];
    _display.text = [NSString stringWithFormat:@"%@", numToString];
    
    self.resetDisplay = YES;
}

-(IBAction) clearInput:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: nil
                                                    message:@"Are you sure you want to clear the display?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
}

-(void) alertView:(UIAlertView *) alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // user chose yes. clear display
    if(buttonIndex == 1) {
        _display.text = @"0";
    }
}

- (void) storeNumber {
    // get number from user
    double numEntered = [_display.text doubleValue];
    
    // push number on to stack
    [self.comp pushOperand: numEntered];
}
///////////////////////

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.operationUserHasPressed = [[NSString alloc] init];
    self.comp = [[Compute alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
