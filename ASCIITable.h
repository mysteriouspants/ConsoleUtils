//
//  ASCIITable.h
//  ConsoleUtils
//
//  Created by Christopher Miller on 3/15/12.
//  Copyright (c) 2012 Christopher Miller. All rights reserved.
//

enum ASCIIAlign {
  kLeft   =0,
  kCentre =1,
  kCenter =1,
  kRight  =2
};

@class ASCIIRow;
@class ASCIICell;

@interface ASCIITable : NSObject

@property (strong) NSMutableArray * rows;

- (NSUInteger)addRow;

- (NSUInteger)addString:(NSString *)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
- (NSUInteger)addDouble:(double)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
- (NSUInteger)addInteger:(NSInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
- (NSUInteger)addUnsignedInteger:(NSUInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;

- (NSUInteger)addString:(NSString *)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx;
- (NSUInteger)addDouble:(double)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx;
- (NSUInteger)addInteger:(NSInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx;
- (NSUInteger)addUnsignedInteger:(NSUInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx;

- (ASCIIRow *)rowAtIndex:(NSUInteger)rowIdx;
- (ASCIICell *)cellAtRow:(NSUInteger)row column:(NSUInteger)col;

@end

@interface ASCIIRow : NSObject

@property (strong) NSMutableArray * cells;

- (NSUInteger)addString:(NSString *)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
- (NSUInteger)addDouble:(double)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
- (NSUInteger)addInteger:(NSInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
- (NSUInteger)addUnsignedInteger:(NSUInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;

@end

@interface ASCIICell : NSObject

@property (strong) NSString * contents;
@property (assign) enum ASCIIAlign align;
@property (assign) NSUInteger colSpan;
@property (assign) BOOL ignoreWidth;

+ (id)cellWithString:(NSString *)contents align:(enum ASCIIAlign)align;
+ (id)cellWithString:(NSString *)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
+ (id)cellWithDouble:(double)contents align:(enum ASCIIAlign)align;
+ (id)cellWithDouble:(double)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
+ (id)cellWithInteger:(NSInteger)contents align:(enum ASCIIAlign)align;
+ (id)cellWithInteger:(NSInteger)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;
+ (id)cellWithUnsignedInteger:(NSUInteger)contents align:(enum ASCIIAlign)align;
+ (id)cellWithUnsignedInteger:(NSUInteger)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth;

@end