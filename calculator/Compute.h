//
//  Compute.h
//  ios-group-fordham-project-1
//
//  Created by Paul Fordham on 5/29/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Compute : NSObject

@property(nonatomic, strong) NSMutableArray *programStack;

-(void) pushOperand: (double)operand;
-(double) performOperation: (NSString *)operation;
-(double) popOperand;

@end
