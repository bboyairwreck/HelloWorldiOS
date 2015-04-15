//
//  Person.m
//  HelloWorld1
//
//  Created by Eric Chee on 11/7/14.
//  Copyright (c) 2014 Eric Chee. All rights reserved.
//

#import "Person.h"

@implementation Person

// Names of properties for subscripting
NSString *const kFirstNameKey = @"firstName";
NSString *const kLastNameKey = @"lastName";

- (id)init
{
    self = [super init];
    if (self) {
        _lastName = @"Chee";
    }
    
    return self;
}

- (void) setFirstName:(NSString *)firstName {
    _firstName = [firstName stringByAppendingString:@" Frank"];
}

- (BOOL) isEricInLoveWith:(NSString *)food
                  andAlso:(NSString *)drink
{
    if (food == nil) {
        NSLog(@"Object is null");
        return TRUE;
    } else {
        NSLog(@"eric chee does love %@ & %@", food, drink);
        return FALSE;
    }
}

+ (void) poop
{
    NSLog(@"pooping");
}

// Subscripting

//called when prog provides key & wants to read value of that key
- (id) objectForKeyedSubscript:(id<NSCopying>)paramKey
{
    NSObject<NSCopying> *keyAsObject = (NSObject<NSCopying> *)paramKey;
    
    if ([keyAsObject isKindOfClass:[NSString class]]){
        NSString *keyAsString = (NSString *)keyAsObject;
        if ([keyAsString isEqualToString:kFirstNameKey] || [keyAsString isEqualToString:kLastNameKey]){
            return [self valueForKey:keyAsString];
        }
    }
    
    return nil;
}

// when prog wants to set value of key
- (void) setObject:(id)paramObject forKeySubscript:(id<NSCopying>)paramKey
{
    NSObject<NSCopying> *keyAsObject = (NSObject<NSCopying> *)paramKey;
    if ([keyAsObject isKindOfClass:[NSString class]]){
        NSString *keyAsString = (NSString *)keyAsObject;
        if ([keyAsString isEqualToString:kFirstNameKey] ||
            [keyAsString isEqualToString:kLastNameKey]){
            [self setValue:paramObject forKey:keyAsString];
        }
    }
}


@end
