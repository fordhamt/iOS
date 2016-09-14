//
//  Hero.h
//  finalProject
//
//  Created by Paul Fordham on 7/19/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* info;
@property(nonatomic, strong) NSString* imageFile;
@property(nonatomic, strong) NSString* winRate;
@property(nonatomic, strong) NSString* type;

@property(nonatomic, strong) NSString* ability1;
@property(nonatomic, strong) NSString* ability2;
@property(nonatomic, strong) NSString* trait;
@property(nonatomic, strong) NSString* ability3;


@property(nonatomic, strong) NSString* ult1;
@property(nonatomic, strong) NSString* ult2;

@property(nonatomic, strong) NSString* price;
@property(nonatomic, strong) NSString* hp;
@property(nonatomic, strong) NSString* hpRegen;
@property(nonatomic, strong) NSString* mana;
@property(nonatomic, strong) NSString* manaRegen;
@property(nonatomic, strong) NSString* range;
@property(nonatomic, strong) NSString* ats;
@property(nonatomic, strong) NSString* damage;

@property(nonatomic, strong) NSString* maxhp;
@property(nonatomic, strong) NSString* regenper;
@property(nonatomic, strong) NSString* damageper;

@property(nonatomic, strong) NSArray* talentsArray;

@property(nonatomic, strong) NSString* imgtrait;
@property(nonatomic, strong) NSString* imgab1;
@property(nonatomic, strong) NSString* imgab2;
@property(nonatomic, strong) NSString* imgab3;
@property(nonatomic, strong) NSString* imgult1;
@property(nonatomic, strong) NSString* imgult2;

@end
