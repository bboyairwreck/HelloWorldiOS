//
//  ReceiveNotification.h
//  HelloWorld1
//
//  Created by Eric Chee on 12/21/14.
//  Copyright (c) 2014 Eric Chee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReceiveNotification : NSObject

- (void) listenStringNotification;;
- (void) appendingIsFinished:(NSNotification *)paramNotification;

@end
