//
//  ViewController.h
//  finalProject
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "Hero.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property IBOutlet UICollectionView *collectionView;

@end

