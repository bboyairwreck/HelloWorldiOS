//
//  ViewController.m
//  HelloWorld1
//
//  Created by Eric Chee on 10/11/14.
//  Copyright (c) 2014 Eric Chee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#import "Person.h"
#import "Father.h"

@implementation ViewController

/*
 * ===  ======
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ViewController strings];
    [ViewController compareObjects];
    [ViewController forLoopsAndWhileLoops];
    [ViewController customClassesAndObjects];
    [ViewController numbers];
    [ViewController arrays];
    [ViewController dictionaries];
    [ViewController sets];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self showAlert];
    [self createSlider];
    
}


/*
 * === STRINGS ======
 */
+ (void) strings
{
    // NSString
    NSString *string1 = @"This is a simple string";                                             // use this format
    NSString *string2 = [NSString stringWithString:@"This is string2"];                         // this is redundant, not recommended
    NSString *string3 = [[NSString alloc] initWithString:@"This is another simple string"];     // this is redundant, not recommended
    
    // Mutable
    NSMutableString *mutableString = @"Mutable String";
    NSMutableString *mutableString2 = [[NSMutableString alloc] initWithString:@"A retained one"];
    NSMutableString *mutableString3 = [NSMutableString stringWithString:string1];
    
    
    // Check String length
    if ([string2 length] != 0)
    {
        NSLog(@"%@", string3);
    }
    
    /*
     NSLog Format
        Strings = %@
        int = %i
        float = %f
        double = %lf
     */
    NSLog(@"Hello %@", string2);
    
    /*Convert String to integer*/
    NSString *stringNum = @"123.465";
    NSInteger integerOfString = [stringNum integerValue];
    NSLog(@"integerOfString = %ld", integerOfString);
    
    // Find String within String
    NSString *haystack = @"My Simple String";
    NSString *needle = @"Simple";
    NSRange range = [haystack rangeOfString:needle];
    
    if (range.location == NSNotFound) {
        // Couldn't find
    } else {
        NSLog(@"Found %@ in %@ at location %lu",
              needle,
              haystack,
              (unsigned long)range.location);
    }
    
    // Apending Strings
    NSMutableString *mutableString4 = [[NSMutableString alloc] initWithString:@"My Macbook"];
    [mutableString4 appendString:@" Pro"];
    
    // Find & Replace substring in String
    [mutableString4 replaceOccurrencesOfString:@"My "
                                    withString:[NSString string]
                                       options:NSCaseInsensitiveSearch
                                         range:NSMakeRange(0, [mutableString4 length])];
    
    NSLog(@"mutableString4 = %@", mutableString4);
    
    // compare length
    if ([mutableString4 length] > 3) {
        NSLog(@"Longer than 3");
    }
}

/*
 * === COMPARE OBJECTS ======
 */
+ (void) compareObjects
{
    NSObject *object1 = [[NSObject alloc] init];
    NSObject *object2 = object1;
    
    if ([object1 isEqual:object2]) {
        NSLog(@"both are equal");
    } else {
        NSLog(@"both are not equal");
    }
}

/*
 * === FOR LOOPS & WHILE LOOPS ======
 */
+ (void) forLoopsAndWhileLoops
{
    NSMutableString *mutableString4 = [[NSMutableString alloc] initWithString:@"How long is this?"];
    
    // For loop
    for (NSUInteger i = 0; i < [mutableString4 length]; i++) {
        NSLog(@"String char count: %lu", i);
    }
    
    // While loop
    NSUInteger count = 0;
    while (count < 4) {
        NSLog(@"Count is at %lu", count);
        count++;
    }
    
}

/*
 * === Custom Classes & Objects ======
 */
+ (void) customClassesAndObjects
{
    Person *p1 = [[Person alloc] init];
    [Person poop]; // calling an class method
    [p1 isEricInLoveWith:@"root beer" andAlso:@"popcorn"];
    p1.firstName = @"Eric";
    
    NSLog(@"First name = %@", [p1 firstName]);
    NSLog(@"Last name = %@", [p1 lastName]);
    
    Father *daddy = [[Father alloc] init];
    [daddy breathe];
}

+ (void) runningLatestiOSSDK
{
    
    /* FIgure out if user has latest iOS SDK
     instancesRespondToSelector:
     ==to determine whether a specific selector exists in an instance of that class
     == selector - method name w/o params i.e. isEricInLoveWith:andAlso:
     */
    NSArray *array = [[NSArray alloc] initWithObjects:@"item1", @"item4", @"item2", @"item5", @"item3", nil];
    NSLog(@"Array = %@", array);
    
    if ([NSArray instancesRespondToSelector:@selector(sortUsingComparator:)]) {
        /* Use the sortUsingComparator: instance method of the array to sort it */
        NSLog(@"Sorting array using Comparator");
        
    } else if ([NSArray instancesRespondToSelector:@selector(sortUsingFunction:context:)]) {
        /* Use the sortUsingFunction:context: instance method of the array to sort */
        NSLog(@"Sorting array using function:context:. Comparator did not work");
    } else {
        NSLog(@"Sorting using comparator or function: does not work. Do something else");
    }
    
    // Or alternatively we could use
    if ([array respondsToSelector:@selector(sortUsingComparator:)]) {
        NSLog(@"using [array respondsToSelector:@selector()]");
    }
    
    
    /* Determine whether instance method is available
     NSClassFromString:
     ==There may be a class like ?Animations? that is not available in latest SDK
     == returns nil if not available */
    if (NSClassFromString(@"NSJSONSerialization") != nil) {
        NSLog(@"The class NSJSONSerialization exists");
    } else {
        NSLog(@"The class NSJSONSerialization DOES NOT exists");
    }
}

/*
 * === NUMBERS ======
 */
+ (void) numbers
{
    /* Numbers */
    NSNumber *signedNumber = @-123456;
    NSNumber *unsignedNumber = @123456;
    NSNumber *floatNumber = @123456.123456f;
    NSNumber *doubleNumber = @123456.1234567890;
    
    NSInteger signedValue = [signedNumber integerValue];
    NSUInteger unsignedValue = [unsignedNumber unsignedIntegerValue];
    CGFloat floatValue = [floatNumber floatValue];
    double doubleValue = [doubleNumber doubleValue];
    NSLog(@"signedValue = %ld, \n"\
          "unsignedValue = %lu \n"\
          "floatValue = %f \n"\
          "doubleValue = %f",
          (long)signedValue,
          (unsigned long)unsignedValue,
          floatValue,
          doubleValue);
    
    // Convert Number to string
    NSString *stringWithIntValue = [NSString stringWithFormat:@"%lu", (unsigned long)[unsignedNumber unsignedIntegerValue]];
    
    NSLog(@"String with int val = %@", stringWithIntValue);
}

/*
 * === ARRAYS ======
 */
+ (void) arrays {
    /*Arrays
     == can hold diff types*/
    NSArray *arrayWithDiffTypes = @[@"My String", @123, @-123];
    NSLog(@"arrayWithDiffTypes = %@", arrayWithDiffTypes);
    
    // For loop array. note you can use objectAtIndex:
    NSArray *array = [[NSArray alloc] initWithObjects:@"item1", @"item4", @"item2", @"item5", @"item3", nil];

    for (NSUInteger i = 0; i < [array count]; i++) {
        id arrayObj = array[i];
        NSLog(@"Object in array = %@", arrayObj);
    }
    
    // For each loop
    for (id object in array) {
        NSLog(@"For each Obj = %@", object);
    }
    
    /*Mutable Arrays */
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:@[@"Mut Item1", @2, @-3]];
    
    NSArray *anotherArray = @[@"str1", @"str2", @"str3"];
    
    // Add & Remove objects w/ Mutable Arrays
    [mutArr addObject:@123];
    [mutArr removeObject:@-3];
    [mutArr addObjectsFromArray:anotherArray];
    
    for (id object in mutArr) {
        NSLog(@"MutArr Obj = %@", object);
    }
    
    //empty array
    // NSMutableArray *mutArr2 = [[NSMutableArray alloc] init]; // empty array
    
    /* enumarate arrays
        enumerateObjectsUsingBlock: typeOfEachObjBeingEnumerated
                                  : NSUwhichIsCurrentIndexOfObjBeingEnunumarted
                                  : BOOLtoStopTheEnumerationAtAnytime
     
        the last param is if you found what you are looking for and
    */
    NSArray *myArray = @[
                         @"String 1",
                         @"String 2",
                         @"String 3",
                         @"String 4"];
    [myArray enumerateObjectsUsingBlock:
     ^(__strong id obj, NSUInteger idx, BOOL *stop) {
         NSLog(@"Object = %@", obj);
     }];
    
    
    // Sorting Arrays
    NSMutableArray *toSortArray = [NSMutableArray arrayWithArray:@[
                                                               @"String 2",
                                                               @"String 4",
                                                               @"String 1",
                                                               @"String 3"]];
    
    [toSortArray sortUsingComparator:
        ^NSComparisonResult(id obj1, id obj2){
            
            NSString *string1 = (NSString *)obj1;
            NSString *string2 = (NSString *)obj2;
            
            return [string1 compare:string2];
        }
     ];
    
    NSLog(@"myArray = %@", toSortArray);
    NSLog(@"Compare value = %ld", [@"String 3" compare:@"String 1"]);
}

/*
 * === DICTIONARIES ======
 */
+ (void) dictionaries
{
    // Dictionaries
    NSDictionary *personDictionary = @{
                                  @"First Name" : @"Anthony",
                                  @"Last Name" : @"Robbins",
                                  @"Age" : @51};
    
    NSLog(@"First Name = %@", personDictionary[@"First Name"]);
    NSLog(@"Last Name = %@", personDictionary[@"Last Name"]);
    NSLog(@"Age = %@", personDictionary[@"Age"]);
    
    // Mutable Dictionaries
    NSMutableDictionary *personMutDictionary = [@{
                                       @"First Name" : @"Anthony",
                                       @"Last Name" : @"Robbins",
                                       @"Age" : @51} mutableCopy];
    
    [personMutDictionary removeObjectForKey:@"Age"];
    
    NSLog(@"First Name = %@", personMutDictionary[@"First Name"]);
    NSLog(@"Last Name = %@", personMutDictionary[@"Last Name"]);
    NSLog(@"Age = %@", personMutDictionary[@"Age"]); // "Age = (null)"
    
    
    // Enumerate Dictionaries
    [personDictionary enumerateKeysAndObjectsUsingBlock:
     ^(__strong id key, __strong id obj, BOOL *stop) {
         NSLog(@"Key = %@, Value = %@", key, obj);
     }];
    
    // Manual fast enumeration FOR EACH
    for (id keyInDictionary in [personDictionary allKeys]){
        id value = [personDictionary objectForKey:keyInDictionary];
        NSLog(@"Key = %@, Object For Key = %@", keyInDictionary, value);
    }
    
    // Enumarate WHILE LOOP with nextObject
        /*
        When using the keyEnumerator method of a mutable dictionary, you are
        NOT ALLOWED TO CHANGE THE VALUES inside the dictionary while going
        through the keys. The same rule, if you remember, applies to mutable
        arrays as well.
        */
    NSEnumerator *keys = [personDictionary keyEnumerator];
    id keyInDictionary = nil;
    while ((keyInDictionary = [keys nextObject]) != nil){
        id objectForKey = [personDictionary objectForKey:keyInDictionary];
        NSLog(@"Key = %@, Object For Key = %@", keyInDictionary, objectForKey);
    }
}

/*
 * === SETS ======
 */
+ (void) sets
{
    // Sets
    NSString *hisName = @"Robert";
    NSString *hisLastName = @"Kiyosaki"; // here
    
    NSString *herName = @"Kim";
    NSString *herLastName = @"Kiyosaki"; // adding this wont change the set
    
    NSSet *setOfNames = [[NSSet alloc] initWithObjects:
                         hisName,
                         hisLastName,
                         herName,
                         herLastName, nil];
    
    NSLog(@"Set = %@", setOfNames);
    
    // Mutable Sets
    NSMutableSet *setOfNames2 = [[NSMutableSet alloc] initWithObjects:
                                hisName,
                                hisLastName, nil];
    
    [setOfNames2 addObject:herName];
    [setOfNames2 addObject:herLastName];
    
    [setOfNames2 removeObject:@"Kiyosaki"];
    
    NSLog(@"Mutable Set = %@", setOfNames2);
    
    // Enumerate over Sets
    [setOfNames enumerateObjectsUsingBlock:^(__strong id obj, BOOL *stop) {
        
        if ([obj isKindOfClass:[NSString class]]){
            NSString *string = (NSString *)obj;
            
            if ([string isEqualToString:@"Kiyosaki"]){
                NSLog(@"Found %@ in the set", string);
                *stop = YES;
            }
        }
    }];
    
    
}

/*
 * === SUBSCRIPTING ======
 * accessing fields/properties with []
 */
+ (void) subscripting {
    Person *person = [Person new];
    person[kFirstNameKey] = @"Tim";
    person[kLastNameKey] = @"Cook";
    __unused NSString *firstName = person[kFirstNameKey];
    __unused NSString *lastName = person[kLastNameKey];
}

/*
 * === ALERTS ======
 */
- (void) showAlert
{
    NSString *alertMsg = @"Are you sure you wanna open this link?";
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert Title"
                                                        message:alertMsg
                                                       delegate:self
                                              cancelButtonTitle:[self noButtonTitle]            // method for cancel btn
                                              otherButtonTitles:[self yesButtonTitle], nil];    // method for yes btn
    [alertView show];
    
}

- (NSString *) yesButtonTitle { return @"Yes"; }

- (NSString *) noButtonTitle{ return @"No"; }

/**
 * Because we implement the UIAlertViewDelegate i.e.:
 *      @interface ViewController : UIViewController <UIAlertViewDelegate>
 */
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:[self yesButtonTitle]]) {
        NSLog(@"User pressed YES");
        
    } else if ([buttonTitle isEqualToString:[self noButtonTitle]]) {
        NSLog(@"User pressed the No button.");
    }
}

/*
 * === UI SLIDER ======
 */
- (void) createSlider {
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f,
                                                             0.0f,
                                                             200.0f,
                                                             23.0f)];
    
    self.slider.center = self.view.center;
    
    self.slider.minimumValue = 0.0f;                        // set min value
    self.slider.maximumValue = 100.0f;                      // set max value
    self.slider.value = self.slider.maximumValue / 2.0;     // set value
    [self.view addSubview:self.slider];                     // add slider as subview
    
    // detech if Slider changed
    [self.slider addTarget:self
                    action:@selector(sliderValueChanged:)
          forControlEvents:UIControlEventValueChanged];
}
     
- (void) sliderValueChanged:(UISlider *)paramSender
{
    if ([paramSender isEqual:self.slider]) {
        NSLog(@"Slider val = %f", paramSender.value);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
