//
//  Console.h
//  ConsoleUtils
//
//  Created by Christopher Miller on 1/13/12.
//  Copyright (c) 2012 Christopher Miller. All rights reserved.
//

/**
 * If you've ever wanted NSLog without the header junk, go no further.
 */

void Print  (NSString* format, ...)        NS_FORMAT_FUNCTION(1,2); //! printf
void PrintLn(NSString* format, ...)        NS_FORMAT_FUNCTION(1,2); //! printf + \n
void PrintLnThenDie(NSString* format, ...) NS_FORMAT_FUNCTION(1,2); //! this one exits the program, too
