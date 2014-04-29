//
//  CalculatorViewController.h
//  CalcUtil
//
//  Created by Alexander Scott on 29/04/2014.
//  Copyright (c) 2014 CADCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface CalculatorViewController : UIViewController

@property(weak, nonatomic) IBOutlet UILabel *display;
@property(strong) id <Calculator> calculator;

- (IBAction)valuePressed:(id)sender;

- (IBAction)clearPressed:(id)sender;
@end
