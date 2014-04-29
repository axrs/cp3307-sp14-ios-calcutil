//
//  main.m
//  CalcUtil
//
//  Created by Alexander Scott on 29/04/2014.
//  Copyright (c) 2014 CADCoder. All rights reserved.
//
#import <PixateFreestyle/PixateFreestyle.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char *argv[]) {
    @autoreleasepool {
        [PixateFreestyle initializePixateFreestyle];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
