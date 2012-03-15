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
    
    // make some some funny data
    t = [[ASCIITable alloc] init];
    
    [t addRow];
    [t addString:@"" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"Bill Clinton" withAlign:kCenter colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"George W Bush" withAlign:kCenter colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"Barak Obama" withAlign:kCenter colSpan:1 shouldIgnoreWidth:NO];
    
    [t addRow];
    [t addString:@"Kookiness" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"Arkansas. Need I say more?" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"Hurr derp!" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"ALIENS" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    
    [t addRow];
    [t addString:@"Actual Metrics" withAlign:kLeft colSpan:1 shouldIgnoreWidth:YES];
    
    [t addRow];
    [t addString:@"In Office" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"1994 - 2000" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"2000 - 2008" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    [t addString:@"2008 - present" withAlign:kRight colSpan:1 shouldIgnoreWidth:NO];
    
    PrintLn(@"Some funny data");
    PrintLn(@"%@", t);
    
  }
  
  return 0;
}
