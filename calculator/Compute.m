//
//  Compute.m
//  ios-group-fordham-project-1
//
//  Created by Paul Fordham on 5/29/16.
//  Copyright © 2016 Paul Fordham. All rights reserved.
//

#import "Compute.h"

@implementation Compute
- (instancetype) init {
    //call initializer for NSObject
    self = [super init];
    if (self)
        self.programStack = [[NSMutableArray alloc] init];
    
    return self;
}

- (double) popOperand {
    
    id operand = [self.programStack lastObject];
    [self.programStack removeLastObject];
    
    return [operand doubleValue];
}

- (void) pushOperand:(double)operand {
    [self.programStack addObject:[NSNumber numberWithDouble: operand]];
}

- (double) performOperation:(NSString *)operation {
    double op1 = 0, op2 = 0, result = 0;
    // peform addition
    if([operation isEqualToString:@"+"]) {
        op1 = [self popOperand];
        op2 = [self popOperand];
        result = op1 + op2;
    }
    // insert your code here
    // subtraction
    else if([operation isEqualToString:@"-"]) {
        op1 = [self popOperand];
        op2 = [self popOperand];
        result = op2 - op1;
    }
    // division
    else if([operation isEqualToString:@"/"]) {
        op1 = [self popOperand];
        op2 = [self popOperand];
        result = op2 / op1;
    }
    // multiplication
    else if([operation isEqualToString:@"*"]) {
        op1 = [self popOperand];
        op2 = [self popOperand];
        result = op1 * op2;
    }

    return result;
}

@end
