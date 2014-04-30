//
//  CalculatorViewController.m
//  CalcUtil
//
//  Created by Alexander Scott on 29/04/2014.
//  Copyright (c) 2014 CADCoder. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorModel.h"

#import <AudioToolbox/AudioToolbox.h>

@interface CalculatorViewController () {
    SystemSoundID clickSoundID;
}
@end

@implementation CalculatorViewController

@synthesize calculator;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSBundle *main = [NSBundle mainBundle];
    NSString *path = [main pathForResource:@"click" ofType:@"mp3"];

    CFURLRef ref = (__bridge CFURLRef)[NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID(ref, & clickSoundID);
}

- (id <Calculator>)calculator {
    if (calculator == nil) {
        NSLog(@"Creating Basic Calculator Model.");
        CalculatorModel *model = [[CalculatorModel alloc] init];
        [self setCalculator:model];
    }
    return calculator;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//On Calculator value press
- (IBAction)valuePressed:(id)sender {
    AudioServicesPlaySystemSound(clickSoundID);
    double value = [[sender currentTitle] doubleValue];
    [[self calculator] addValue:value];
    [self updateDisplay];

    //Reset to the main view if a value is outside the normal numpad range
    if (value < 1 || value > 9) {
        [self otherPressed:nil];
    }
}

//On clear button press
- (IBAction)clearPressed:(id)sender {
    AudioServicesPlaySystemSound(clickSoundID);
    [[self calculator] clear];
    [self updateDisplay];
}

//On other button pressed
- (IBAction)otherPressed:(id)sender {
    AudioServicesPlaySystemSound(clickSoundID);
    BOOL mainIsHidden = [[self mainView] isHidden];
    [[self mainView] setHidden:!mainIsHidden];
    [[self otherView] setHidden:mainIsHidden];
}

//Update the calculator display to show the new value.
//ToDo: Notify of changes from within the model.
- (void)updateDisplay {
    double value = [[self calculator] value];
    NSString *displayValue = [[NSString alloc] initWithFormat:@"%0.2f", value];
    [[self display] setText:displayValue];
}

@end
