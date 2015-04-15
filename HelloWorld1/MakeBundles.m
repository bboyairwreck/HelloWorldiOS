//
//  MakeBundles.m
//  HelloWorld1
//
//  Created by Eric Chee on 12/21/14.
//  Copyright (c) 2014 Eric Chee. All rights reserved.
//

#import "MakeBundles.h"

@implementation MakeBundles

+ (void) createBundleWithImage
{
    
    NSString *resourcesBundlePath = [[NSBundle mainBundle] pathForResource:@"Resources" ofType:@"bundle"];
    
    // If found Resources Bundle Path
    if ([resourcesBundlePath length] > 0){
        NSBundle *resourceBundle = [NSBundle bundleWithPath:resourcesBundlePath];   // create bundle
        
        // If Created Bundle successful
        if (resourceBundle != nil) {
            NSString *pathToAug2Image = [resourceBundle pathForResource:@"aug2" ofType:@"jpg" inDirectory:@"Images"];
            
            // If found path to file
            if ([pathToAug2Image length] > 0) {
                UIImage *image = [UIImage imageWithContentsOfFile:pathToAug2Image];
                
                // if found image
                if (image != nil) {
                    NSLog(@"Successfully loaded the file as an image.");
                } else {
                    NSLog(@"Failed to load the file as an image.");
                }
            } else {
                NSLog(@"Failed to find the file inside the bundle.");
            }
        } else {
            NSLog(@"Failed to load the bundle.");
        }
    } else {
        NSLog(@"Could not find the bundle.");
    }
}

@end
