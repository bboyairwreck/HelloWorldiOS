//
//  ViewController.h
//  HelloWorld1
//
//  Created by Eric Chee on 10/11/14.
//  Copyright (c) 2014 Eric Chee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, strong) UISlider *slider;

+ (void) strings;
+ (void) compareObjects;
+ (void) forLoopsAndWhileLoops;
+ (void) customClassesAndObjects;
+ (void) numbers;
+ (void) arrays;
+ (void) dictionaries;
+ (void) sets;

- (void) showAlert;
- (void) createSlider;

@end

