//
//  ViewController.m
//  2.2
//
//  Created by Paul Fordham on 6/8/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize pickerChoice;
@synthesize pickerArray, meds;

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // array of objects for picker view
    NSArray *array = [[NSArray alloc] initWithObjects:
                      @"Allergies",
                      @"Cold",
                      @"Fever",
                      @"Flu",
                      @"Headache",
                      @"Stomachache", nil];
    
    self.pickerArray = array;
    
    // connect data
    self.pickerChoice.dataSource = self;
    self.pickerChoice.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// number of cols
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    // We are working with a picker view of a single column
    return 1;
}

// num rows
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    // return array size
    return [pickerArray count];
}

// delegate method to retrieve the selected item from pickerview
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [pickerArray objectAtIndex:row];
}

// get picker selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // method invoked when choice selected from pickerview
    // row parameter used to represet selected object
    
    NSString * mystr =[pickerArray objectAtIndex: row];
    
    NSString * allergies = @"Allergies";
    NSString * cold = @"Cold";
    NSString * fever = @"Fever";
    NSString * flu = @"Flu";
    NSString * headache = @"Headache";
    NSString * stomachAche = @"Stomachache";

    if([mystr isEqualToString: allergies]) {
        NSLog(@"Selected Element: %@", [pickerArray objectAtIndex: row]);
        meds.text = @"Zyrtec, Claritin, Benadryl";
    }
    if([mystr isEqualToString: cold]) {
        NSLog(@"Selected Element: %@", [pickerArray objectAtIndex: row]);
        meds.text = @"Dayquil, NightQuil, Advil";
    }
    if([mystr isEqualToString: fever]) {
        NSLog(@"Selected Element: %@", [pickerArray objectAtIndex: row]);
        meds.text = @"Advil, Tylenol, Ibprofen";
    }
    if([mystr isEqualToString: flu]) {
        NSLog(@"Selected Element: %@", [pickerArray objectAtIndex: row]);
        meds.text = @"Tamiflu, Relenza, Rapivab";
    }
    if([mystr isEqualToString: headache]) {
        NSLog(@"Selected Element: %@", [pickerArray objectAtIndex: row]);
        meds.text = @"Advil, Tylenol, Ibprofen";
    }
    if([mystr isEqualToString: stomachAche]) {
        NSLog(@"Selected Element: %@", [pickerArray objectAtIndex: row]);
        meds.text = @"Pepto Bismol, Imodium, Tums";
    }
   
}

@end
