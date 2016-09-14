//
//  ViewController.m
//  assign4-redo
//
//  Created by Paul Fordham on 7/27/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import <sqlite3.h>

#define METERS_MILE 1609.344
#define METERS_FEET 3.28084

@interface ViewController ()
<CLLocationManagerDelegate>
@end

TableViewController* tableController=nil;

@implementation ViewController
@synthesize latitude;
@synthesize longitude;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[self mapViewer] setShowsUserLocation:YES];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    [[self locationManager] setDelegate:self];
    
    // we have to setup the location maanager with permission in later iOS versions
    if ([[self locationManager] respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [[self locationManager] requestWhenInUseAuthorization];
    }
    
    [[self locationManager] setDesiredAccuracy:kCLLocationAccuracyBest];
    [[self locationManager] startUpdatingLocation];

    // Do any additional setup after loading the view, typically from a nib.
//[latitude setDelegate:self];
//   [longitude setDelegate:self];
    
    tableController = [self.storyboard instantiateViewControllerWithIdentifier:@"TableViewController"];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:[self getDbFilePath]])
        [self createTable:[self getDbFilePath]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *) getDbFilePath {
    NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [docsPath stringByAppendingPathComponent:@"coords.db"];
}

-(int) createTable:(NSString *) filePath {
    sqlite3 *db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
          
    if (SQLITE_OK != rc) {
        sqlite3_close(db);
        NSLog(@"Failed to open db connection");
    }
    else {
        char * query ="CREATE TABLE IF NOT EXISTS coords ( id INTEGER PRIMARY KEY AUTOINCREMENT, latitude  TEXT, longitude TEXT )";
        char * errMsg;
        rc = sqlite3_exec(db, query, NULL, NULL, &errMsg);
        
        if(SQLITE_OK != rc)
            NSLog(@"Failed to create table rc:%d, msg=%s", rc, errMsg);
        
        sqlite3_close(db);
    }
    
    return rc;
}

-(int) insert:(NSString *)filePath withLatCoord:(NSString *)lati withlongCoord:(NSString *)longi {
    sqlite3* db = NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE , NULL);
    if (SQLITE_OK != rc) {
        sqlite3_close(db);
        NSLog(@"Failed to open db connection");
    }
    else {
        NSString * query  = [NSString
                             stringWithFormat:@"INSERT INTO coords (latitude, longitude) VALUES (\"%@\", \"%@\")"
                             , lati, longi];
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] , NULL, NULL, &errMsg);
        if(SQLITE_OK != rc)
        {
            NSLog(@"Failed to insert record  rc:%d, msg=%s", rc, errMsg);
        }
        sqlite3_close(db);
    }
    return rc;
}

-(int) insertWithoutExec:(NSString *)filePath withLatCoord:(NSString *)lati withLongCoord:longi {
    sqlite3* db = NULL;
    sqlite3_stmt* stmt =NULL;
    
    int rc=0;
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString * query  = [NSString
                             stringWithFormat:@"INSERT INTO coords (latitude, longitude) VALUES (\"%@\", \"%@\")"
                             , lati, longi];
        
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)
        {
            rc =sqlite3_step(stmt);
            if(rc == SQLITE_DONE) //success
            {
                rc = SQLITE_OK;
            }
            
            sqlite3_finalize(stmt);
        }
        
        sqlite3_close(db);
    }
    return rc;
}

-(NSArray *) getRecords:(NSString*) filePath where:(NSString *)whereStmt {
    NSMutableArray * coords =[[NSMutableArray alloc] init];
    sqlite3 * db = NULL;
    sqlite3_stmt * stmt =NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath UTF8String], &db, SQLITE_OPEN_READONLY , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString  * query = @"SELECT * from coords";
        if(whereStmt)
        {
            query = [query stringByAppendingFormat:@" WHERE %@",whereStmt];
        }
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW) //get each row in loop
            {
                NSString * Latitude = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                NSString * Longitude = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                
                NSDictionary *coord =[NSDictionary dictionaryWithObjectsAndKeys:Latitude, @"latitude",
                                        Longitude, @"longitude", nil];
                
                [coords addObject:coord];
                NSLog(@"lat: %@, long: %@ ", Latitude, Longitude);
                
            }
            NSLog(@"Done");
            sqlite3_finalize(stmt);
        }
        else
        {
            NSLog(@"Failed to prepare statement with rc:%d",rc);
        }
        sqlite3_close(db);
    }
    return coords;
}

-(void) showMessage:(NSString*)title withMessage:(NSString*)message {
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil] show];
    
}

-(IBAction) addRecord:(id)sender
{
    NSString *lati = latitude.text;
    NSString *longi = longitude.text;
    
    if(latitude.text.length == 0 || longitude.text.length == 0)
    {
        [self showMessage:@"ERROR" withMessage:@"Must have valid coordinates"];
    }
    else
    {
        int rc= [self insert:[self getDbFilePath] withLatCoord:lati withlongCoord:longi];
        if(rc != SQLITE_OK)
        {
            [self showMessage:@"ERROR" withMessage:@"Failed to insert record"];
        }
        else
            [self showMessage:@"SUCCESS" withMessage:@"Record is added"];
    }
    
}

-(IBAction) showRecord:(id)sender
{
    NSArray * coords = [self getRecords:[self getDbFilePath] where:nil];
    [tableController setCoords:coords];
    [self.navigationController pushViewController:tableController animated:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [textField resignFirstResponder];
    return YES;
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation *location = locations.lastObject;
    [[self latitude] setText:[NSString stringWithFormat:@"%.3f", location.coordinate.latitude]];
    [[self longitude] setText:[NSString stringWithFormat:@"%.3f", location.coordinate.longitude]];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2*METERS_MILE, 2*METERS_MILE);
    [[self mapViewer] setRegion:viewRegion animated:YES];
}

@end
