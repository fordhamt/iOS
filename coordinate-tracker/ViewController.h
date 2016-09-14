//
//  ViewController.h
//  assign4-redo
//
//  Created by Paul Fordham on 7/27/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) CLLocationManager *locationManager;
@property(weak, nonatomic) IBOutlet MKMapView *mapViewer;

@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;

-(IBAction)showRecord:(id)sender;
-(IBAction)addRecord:(id)sender;

@end

