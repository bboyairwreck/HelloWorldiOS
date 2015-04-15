//
//  PersonProtocol.h
//  HelloWorld1
//
//  Created by Eric Chee on 11/11/14.
//  Copyright (c) 2014 Eric Chee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonProtocol <NSObject>

@optional
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, unsafe_unretained) NSUInteger age;

@required
- (void) breathe;

@end