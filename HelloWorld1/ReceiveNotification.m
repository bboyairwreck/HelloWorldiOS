//
//  ReceiveNotification.m
//  HelloWorld1
//
//  Created by Eric Chee on 12/21/14.
//  Copyright (c) 2014 Eric Chee. All rights reserved.
//

#import "ReceiveNotification.h"


@implementation ReceiveNotification

- (id) init
{
    self = [super init];
    
    return self;
}

- (void) listenStringNotification {
    
    // Listen for notification
    [[NSNotificationCenter defaultCenter] addObserver:self                                          //obj that receives notification (send back to self)
                                             selector:@selector(appendingIsFinished:)               // what the classname it should call when received
                                                 name:@"ResultOfAppendingTwoStringsNotification"    // name of Notification listening for
                                               object:nil];
}

/**
 * Received Notification
 */
- (void) appendingIsFinished:(NSNotification *)paramNotification{
    
    // Check if right Application
    if ([[paramNotification name] isEqualToString:@"ResultOfAppendingTwoStringsNotification"]) {
        NSLog(@"Notification is received.");
        NSLog(@"Notification Object = %@", [paramNotification object]);
        NSLog(@"Notification User-Info Dict = %@", [paramNotification userInfo]);
        
        [self removeObserver];
    }
}

- (void) removeObserver {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSLog(@"Removed observer obj of ReceiveNotificaiton");
}


@end
