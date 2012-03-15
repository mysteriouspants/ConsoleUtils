//
//  Console.m
//  ConsoleUtils
//
//  Created by Christopher Miller on 1/13/12.
//  Copyright (c) 2012 Christopher Miller. All rights reserved.
//

#import "Console.h"
#include <stdio.h>

NSString * stringIndentingWithString(NSString *, NSString *);

void Print  (NSString* format, ...)
{
    va_list arguments;
    va_start(arguments, format);
    NSString* s0 = [[NSString alloc] initWithFormat:format arguments:arguments];
    va_end(arguments);
    printf("%s", [s0 UTF8String]);
    fflush(stdout); // This doesn't necessarily work on all platforms!
}

void PrintLn(NSString *format, ...)
{
    va_list arguments;
    va_start(arguments, format);
    NSString* s0 = [[NSString alloc] initWithFormat:format arguments:arguments];
    va_end(arguments);
    printf("%s\n", [s0 UTF8String]);
}

void PrintLnThenDie(NSString* format, ...)
{
    va_list arguments;
    va_start(arguments, format);
    NSString* s0 = [[NSString alloc] initWithFormat:format arguments:arguments];
    va_end(arguments);
    printf("%s\n", [s0 UTF8String]);
    exit(-1);
}
