# ConsoleUtils

Short, simple stuff for making things happen in Objective-C when printing to the console. Great for command-line tools and other such nonsense.

## Console.h

These are some quick functions for printing to `stdout`. They're short and to the point, almost drop-in replacements for `NSLog`. Use this if you don't want `NSLog`'s much more verbose output!

## ASCIITable.h

A tool for managing data you want to output in an aligned, ASCII-formatted table. For example:

    > ./asciiTableTest 
    Drumroll please!
               Josef Stalin Adolf Hitler
         Reign  1937 - 1941  1927 - 1944
    Death Toll    100000000     14000000
    
    Pay attention, Hitler's death toll should have changed alignment!
               Josef Stalin Adolf Hitler
         Reign  1937 - 1941  1927 - 1944
    Death Toll    100000000   14000000  
    
Pretty sweet, no? (The output, not the test data!)