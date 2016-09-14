//
//  ViewController.h
//  2.2
//
//  Created by Paul Fordham on 6/8/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    IBOutlet UIPickerView * pickerChoice;
    IBOutlet UITextField *meds;
    
    NSArray *pickerArray;
}

@property (nonatomic, retain) UIPickerView *pickerChoice;
@property (nonatomic, retain) NSArray *pickerArray;
@property (nonatomic, retain) UITextField *meds;

@end

