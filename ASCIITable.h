//
//  ASCIITable.h
//  ConsoleUtils
//
//  Created by Christopher Miller on 3/15/12.
//  Copyright (c) 2012 Christopher Miller. All rights reserved.
//

/**
 * Simple-ish class for keeping a matrix of strings, and then outputting them as a string that's an ASCII-art table.
 * 
 * See ASCIITableTest.m for an example.
 */


enum ASCIIAlign {
  kLeft   =0, //! |Content      |
  kCentre =1, //! |   Content   |
  kRight  =2, //! |      Content|
  kCenter =1, //! alternate spelling of kCentre
};

@class ASCIIRow;
@class ASCIICell;

/**
 * Root container class responsible for keeping track of rows.
 */
@interface ASCIITable : NSObject

@property (strong) NSMutableArray * rows;

/** Convenience method to append a new row. */
- (NSUInteger)addRow;

/** Append a string to the end of the last row. */
- (NSUInteger)addString:(NSString *)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
/** Append a double to the end of the last row. */
- (NSUInteger)addDouble:(double)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
/** Append an integer to the end of the last row. */
- (NSUInteger)addInteger:(NSInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
/** Append an unsigned integer to the end of the last row. */
- (NSUInteger)addUnsignedInteger:(NSUInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;

/** Append a string to the end of the indicated row. */
- (NSUInteger)addString:(NSString *)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx;
/** Append a double to the end of the indicated row. */
- (NSUInteger)addDouble:(double)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx;
/** Append an integer to the end of the indicated row. */
- (NSUInteger)addInteger:(NSInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx;
/** Append an unsigned integer to the end of the indicated row. */
- (NSUInteger)addUnsignedInteger:(NSUInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx;

/** Get the indicated row. */
- (ASCIIRow *)rowAtIndex:(NSUInteger)rowIdx;
/** Get the indicated cell. */
- (ASCIICell *)cellAtRow:(NSUInteger)row column:(NSUInteger)col;

@end

/** Layer between NSMutableArray and the ASCIICells. */
@interface ASCIIRow : NSObject

@property (strong) NSMutableArray * cells;

- (NSUInteger)addString:(NSString *)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
- (NSUInteger)addDouble:(double)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
- (NSUInteger)addInteger:(NSInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
- (NSUInteger)addUnsignedInteger:(NSUInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;

@end

/** Represents information about how to format a cell in a table. */
@interface ASCIICell : NSObject

@property (strong) NSString * contents; //! The contents of the cell.
@property (assign) enum ASCIIAlign align; //! How does it want to be aligned?
@property (assign) NSUInteger colSpan; //! How many columns does this cell span?
@property (assign) BOOL ignoreWidth; //! Should the width of contents be ignored when trying to find the maximum cell width for this column?

+ (id)cellWithString:(NSString *)contents align:(enum ASCIIAlign)align;
+ (id)cellWithString:(NSString *)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
+ (id)cellWithDouble:(double)contents align:(enum ASCIIAlign)align;
+ (id)cellWithDouble:(double)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
+ (id)cellWithInteger:(NSInteger)contents align:(enum ASCIIAlign)align;
+ (id)cellWithInteger:(NSInteger)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
+ (id)cellWithUnsignedInteger:(NSUInteger)contents align:(enum ASCIIAlign)align;
+ (id)cellWithUnsignedInteger:(NSUInteger)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;

@end