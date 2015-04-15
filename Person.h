//
//  Person.h
//  HelloWorld1
//
//  Created by Eric Chee on 11/7/14.
//  Copyright (c) 2014 Eric Chee. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kFirstNameKey;   // allow other classes to read these constants
extern NSString *const kLastNameKey;    // " "

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSNumber *age;

- (BOOL) isEricInLoveWith:(NSString *)food
                  andAlso:(NSString *)drink;
+ (void) poop;


// For adding Subscripting Support
    // so can set firstName & lastName quickly
- (id) objectForKeyedSubscript:(id<NSCopying>)paramKey;                         //called when prog provides key & wants to read value of that key
- (void) setObject:(id)paramObject forKeyedSubscript:(id<NSCopying>)paramKey;   // when prog wants to set value of key

@end
