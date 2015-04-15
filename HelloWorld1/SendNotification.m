//
//  SendNotification.m
//  HelloWorld1
//
//  Created by Eric Chee on 12/21/14.
//  Copyright (c) 2014 Eric Chee. All rights reserved.
//

#import "SendNotification.h"

@implementation SendNotification

// Notification Name - String apend
const NSString *ResultOfAppendingTwoStringsNotification = @"ResultOfAppendingTwoStringsNotification";

/* Keys inside the dictionary that our notification sends */
const NSString *ResultOfAppendingTwoStringsFirstStringInfoKey = @"firstString";
const NSString *ResultOfAppendingTwoStringsSecondStringInfoKey = @"secondString";
const NSString *ResultOfAppendingTwoStringsResultStringInfoKey = @"resultString";

/* Notification name - For no object*/
const NSString *NetworkConnectivityWasFoundNotification = @"NetworkConnectivityWasFoundNotification";

+ (void) sendAppendStringNotif
{
    NSString *firstName = @"Anthony";
    NSString *lastName = @"Robbins";
    NSString *fullName = [firstName stringByAppendingString:lastName];
    
    // Add keys & objects for User-Info-Dictionary to send with Notification
    NSArray *objects = [[NSArray alloc] initWithObjects:firstName, lastName, fullName, nil];
    
    NSArray *keys = [[NSArray alloc] initWithObjects:
                     ResultOfAppendingTwoStringsFirstStringInfoKey,
                     ResultOfAppendingTwoStringsSecondStringInfoKey,
                     ResultOfAppendingTwoStringsResultStringInfoKey,
                     nil];
    
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
    
    // Create Notification
    NSNotification *notificationObject = [NSNotification notificationWithName:(NSString *)ResultOfAppendingTwoStringsNotification
                                                                       object:self
                                                                     userInfo:userInfo];
    
    // post notification
    [[NSNotificationCenter defaultCenter] postNotification:notificationObject];

}

+ (void) sendNotifWithNoObject
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:(NSString *)NetworkConnectivityWasFoundNotification
     object:nil];
}


@end
