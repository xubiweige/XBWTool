//
//  PDGlobalCore.m
//  CSDClient
//
//  Created by IvanLee on 14/12/11.
//  Copyright (c) 2014年 PHTData. All rights reserved.
//

#import "PDGlobalCore.h"

#import <objc/runtime.h>

// No-ops for non-retaining objects.
static const void* MBRetainNoOp(CFAllocatorRef allocator, const void *value) { return value; }
static void MBReleaseNoOp(CFAllocatorRef allocator, const void *value) { }


///////////////////////////////////////////////////////////////////////////////////////////////////
NSMutableArray* MBCreateNonRetainingArray() {
    CFArrayCallBacks callbacks = kCFTypeArrayCallBacks;
    callbacks.retain = MBRetainNoOp;
    callbacks.release = MBReleaseNoOp;
    return (NSMutableArray*)CFBridgingRelease(CFArrayCreateMutable(nil, 0, &callbacks));
}


///////////////////////////////////////////////////////////////////////////////////////////////////
NSMutableDictionary* MBCreateNonRetainingDictionary() {
    CFDictionaryKeyCallBacks keyCallbacks = kCFTypeDictionaryKeyCallBacks;
    CFDictionaryValueCallBacks callbacks = kCFTypeDictionaryValueCallBacks;
    callbacks.retain = MBRetainNoOp;
    callbacks.release = MBReleaseNoOp;
    return (NSMutableDictionary*)CFBridgingRelease(CFDictionaryCreateMutable(nil, 0, &keyCallbacks, &callbacks));
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL MBIsArrayWithItems(id object) {
    return [object isKindOfClass:[NSArray class]] && [(NSArray*)object count] > 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL MBIsSetWithItems(id object) {
    return [object isKindOfClass:[NSSet class]] && [(NSSet*)object count] > 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL MBIsStringWithAnyText(id object) {
    return [object isKindOfClass:[NSString class]] && [(NSString*)object length] > 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
void SwapMethods(Class cls, SEL originalSel, SEL newSel) {
    Method originalMethod = class_getInstanceMethod(cls, originalSel);
    Method newMethod = class_getInstanceMethod(cls, newSel);
    method_exchangeImplementations(originalMethod, newMethod);
}

NSString* MBNonEmptyString(id obj){
    if (obj == nil || obj == [NSNull null] ||
        ([obj isKindOfClass:[NSString class]] && [obj length] == 0)) {
        return @"";
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return MBNonEmptyString([obj stringValue]);
    }
    return obj;
}

NSInteger MBNonEmptyInteger(id obj){
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj integerValue];
    }
    return 0;
}

double MBNonEmptyDouble(id obj){
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj doubleValue];
    }
    return 0.0;
}


BOOL MBNonEmptyBOOL(id obj){
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj boolValue];
    }
    return NO;
}

NSArray *MBNonEmptyArray(id obj){
    if (obj && [obj isKindOfClass:[NSArray class]]) {
        return obj;
    }
    return @[];
}

NSDictionary *MBNonEmptyDictionary(id obj){
    if (obj && [obj isKindOfClass:[NSDictionary class]]) {
        return obj;
    }
    return @{};
}

BOOL MBIsStringContantDrop(id object){
    return [object isKindOfClass:[NSString class]] && [object rangeOfString:@"."].location != NSNotFound;
}

