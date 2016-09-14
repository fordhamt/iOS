//
//  AddGroceryViewController.m
//  assignment-3-ios
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "AddGroceryViewController.h"

@interface AddGroceryViewController ()

@property IBOutlet UITextField *textField;

@end

@implementation AddGroceryViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // if user input a grocery item
    if (self.textField.text.length > 0) {
        self.grocery = [[Grocery alloc] init];
        self.grocery.groceryName = self.textField.text;
        self.grocery.inCart = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
