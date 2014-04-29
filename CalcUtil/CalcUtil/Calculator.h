//
// Created by Alexander Scott on 29/04/2014.
// Copyright (c) 2014 CADCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Calculator <NSObject>
@required
- (double)value;

- (void)addValue:(double)value;

- (void)clear;
@end