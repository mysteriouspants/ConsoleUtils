//
//  Console.h
//  ConsoleUtils
//
//  Created by Christopher Miller on 1/13/12.
//  Copyright (c) 2012 Christopher Miller. All rights reserved.
//

void Print  (NSString* format, ...)        NS_FORMAT_FUNCTION(1,2);
void PrintLn(NSString* format, ...)        NS_FORMAT_FUNCTION(1,2);
void PrintLnThenDie(NSString* format, ...) NS_FORMAT_FUNCTION(1,2);
