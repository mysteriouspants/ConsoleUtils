//
//  ASCIITableTest.m
//  ConsoleUtils
//
//  Created by Christopher Miller on 3/15/12.
//  Copyright (c) 2012 Christopher Miller. All rights reserved.
//

#import "ASCIITable.h"

int main (int argc, const char * argv[]) {

  @autoreleasepool {
    
    // try to make the following table:
    /*            Josef Stalin Adolf Hitler
     * Reign       1937 - 1941  1927 - 1944
     * Death Toll    100000000     14000000
     */
    
    ASCIITable * t = [[ASCIITable alloc] init];
    [t addRow];
    [t addString:@"" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"Josef Stalin" withAlign:kCenter colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"Adolf Hitler" withAlign:kCenter colSpan:1 shouldIgnoreWidth:NO];
    
    [t addRow];
    [t addString:@"Reign" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"1937 - 1941" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"1927 - 1944" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    
    [t addRow];
    [t addString:@"Death Toll" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addUnsignedInteger:100000000 withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addUnsignedInteger: 14000000 withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    
    PrintLn(@"Drumroll please!");
    PrintLn(@"%@", t);
    
    // center-align Hitler's death toll, just for testing
    [t cellAtRow:2 column:2].align = kCenter;
    
    PrintLn(@"Pay attention, Hitler's death toll should have changed alignment!");
    PrintLn(@"%@", t);
    
  }
  
  return 0;
}
