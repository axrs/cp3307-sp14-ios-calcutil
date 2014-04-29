//
// Created by Alexander Scott on 29/04/2014.
// Copyright (c) 2014 CADCoder. All rights reserved.
//

#import "CalculatorModel.h"


@implementation CalculatorModel {
    double _value;
}

- (double)value {
    return _value;
}

- (void)addValue:(double)value {
    _value += value;
}

- (void)clear {
    _value = 0;
}

@end