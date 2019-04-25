//
//  PDGlobalCore.h
//  CSDClient
//
//  Created by IvanLee on 14/12/11.
//  Copyright (c) 2014年 PHTData. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Creates a mutable array which does not retain references to the objects it contains.
 *
 * Typically used with arrays of delegates.
 */
NSMutableArray* MBCreateNonRetainingArray();

/**
 * Creates a mutable dictionary which does not retain references to the values it contains.
 *
 * Typically used with dictionaries of delegates.
 */
NSMutableDictionary* MBCreateNonRetainingDictionary();

/**
 * Tests if an object is an array which is not empty.
 */
BOOL MBIsArrayWithItems(id object);

/**
 * Tests if an object is a set which is not empty.
 */
BOOL MBIsSetWithItems(id object);

/**
 * Tests if an object is a string which is not empty.
 */
BOOL MBIsStringWithAnyText(id object);

/**
 * Swap the two method implementations on the given class.
 * Uses method_exchangeImplementations to accomplish this.
 */
void MBSwapMethods(Class cls, SEL originalSel, SEL newSel);

/**
 *  [NSNull null], nil, @"" to "-".
 *  NSNumber to NSString.
 *  true -> @"1" | false -> @"0".
 */
NSString* MBNonEmptyString(id obj);
NSInteger MBNonEmptyInteger(id obj);
double MBNonEmptyDouble(id obj);
BOOL MBNonEmptyBOOL(id obj);
NSArray *MBNonEmptyArray(id obj);
NSDictionary *MBNonEmptyDictionary(id obj);

/**
 *  If target string contant ".",return YES;
 *  else return NO;
 */
BOOL MBIsStringContantDrop(id object);