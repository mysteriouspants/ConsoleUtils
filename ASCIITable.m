//
//  ASCIITable.m
//  ConsoleUtils
//
//  Created by Christopher Miller on 3/15/12.
//  Copyright (c) 2012 Christopher Miller. All rights reserved.
//

#import "ASCIITable.h"

@interface ASCIITable ()

- (NSArray *)getColumnWidths;

@end

@interface ASCIIRow ()

- (NSArray *)getMinimumColumnWidths;
- (NSString *)descriptionForColumnWidths:(NSArray *)columnWidths;

@end

@interface ASCIICell ()

- (NSString *)descriptionWithWidth:(NSUInteger)width;

@end

@implementation ASCIITable

@synthesize rows=_rows;

- (NSUInteger)addRow
{
  NSUInteger newIdx = [_rows count];
  [_rows addObject:[[ASCIIRow alloc] init]];
  return newIdx;
}

- (NSUInteger)addString:(NSString *)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  return [[_rows lastObject] addString:contents withAlign:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth];
}

- (NSUInteger)addDouble:(double)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  return [[_rows lastObject] addDouble:contents withAlign:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth];
}

- (NSUInteger)addInteger:(NSInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  return [[_rows lastObject] addInteger:contents withAlign:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth];
}

- (NSUInteger)addUnsignedInteger:(NSUInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  return [[_rows lastObject] addUnsignedInteger:contents withAlign:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth];
}

- (NSUInteger)addString:(NSString *)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx
{
  NSAssert(rowIdx<[_rows count], @"Nonexistant row");
  ASCIIRow * row = [_rows objectAtIndex:rowIdx];
  return [row addString:contents withAlign:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth];
}

- (NSUInteger)addDouble:(double)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx
{
  NSAssert(rowIdx<[_rows count], @"Nonexistant row");
  ASCIIRow * row = [_rows objectAtIndex:rowIdx];
  return [row addDouble:contents withAlign:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth];
}

- (NSUInteger)addInteger:(NSInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx
{
  NSAssert(rowIdx<[_rows count], @"Nonexistant row");
  ASCIIRow * row = [_rows objectAtIndex:rowIdx];
  return [row addInteger:contents withAlign:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth];
}

- (NSUInteger)addUnsignedInteger:(NSUInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth toRow:(NSUInteger)rowIdx
{
  NSAssert(rowIdx<[_rows count], @"Nonexistant row");
  ASCIIRow * row = [_rows objectAtIndex:rowIdx];
  return [row addUnsignedInteger:contents withAlign:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth];
}

- (NSArray *)getColumnWidths
{
  NSMutableArray * columnWidths = [[[_rows objectAtIndex:0] getMinimumColumnWidths] mutableCopy];
  for (ASCIIRow * row in _rows) {
    NSArray * colWidths = [row getMinimumColumnWidths];
    if ([colWidths count]>[columnWidths count])
      [columnWidths addObjectsFromArray:[colWidths subarrayWithRange:NSMakeRange([columnWidths count], [colWidths count]-[columnWidths count])]];
    for (NSUInteger i = 0;
         i < [columnWidths count];
         ++i) {
      NSUInteger colWidth = [[colWidths objectAtIndex:i] unsignedIntegerValue];
      NSUInteger columnWidth = [[columnWidths objectAtIndex:i] unsignedIntegerValue];
      if (colWidth > columnWidth) [columnWidths replaceObjectAtIndex:i withObject:[colWidths objectAtIndex:i]];
    }
  }
  return [columnWidths copy];
}

- (ASCIIRow *)rowAtIndex:(NSUInteger)rowIdx
{
  return [_rows objectAtIndex:rowIdx];
}

- (ASCIICell *)cellAtRow:(NSUInteger)row column:(NSUInteger)col
{
  return [((ASCIIRow *)[_rows objectAtIndex:row]).cells objectAtIndex:col];
}

- (id)init
{
  self = [super init];
  if (self) {
    _rows = [[NSMutableArray alloc] init];
  }
  return self;
}

- (NSString *)description
{
  NSMutableString * description = [NSMutableString string];
  // 1. Find the column widths
  NSArray * columnWidths = [self getColumnWidths];
  for (ASCIIRow * row in _rows) {
    [description appendFormat:@"%@\n", [row descriptionForColumnWidths:columnWidths]];
  }
  return [description copy];
}

@end

@implementation ASCIIRow

@synthesize cells=_cells;

- (NSUInteger)addString:(NSString *)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  NSUInteger newIdx = [_cells count];
  [_cells addObject:
   [ASCIICell cellWithString:contents align:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth]
  ];
  return newIdx;
}

- (NSUInteger)addDouble:(double)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  NSUInteger newIdx = [_cells count];
  [_cells addObject:
   [ASCIICell cellWithDouble:contents align:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth]
  ];
  return newIdx;
}

- (NSUInteger)addInteger:(NSInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  NSUInteger newIdx = [_cells count];
  [_cells addObject:
   [ASCIICell cellWithInteger:contents align:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth]
  ];
  return newIdx;  
}

- (NSUInteger)addUnsignedInteger:(NSUInteger)contents withAlign:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  NSUInteger newIdx = [_cells count];
  [_cells addObject:
   [ASCIICell cellWithUnsignedInteger:contents align:align colSpan:colSpan shouldIgnoreWidth:ignoreWidth]
  ];
  return newIdx;
}

- (NSArray *)getMinimumColumnWidths
{
  // NOTE: Ignores column widths for colSpans
  NSMutableArray * minimumWidths = [NSMutableArray arrayWithCapacity:[_cells count]];
  for (NSUInteger i = 0;
       i < [_cells count];
       ++i) {
    ASCIICell * cell = [_cells objectAtIndex:i];
    for (NSUInteger j = 0;
         j < cell.colSpan;
         ++j)
      if (cell.ignoreWidth)
        [minimumWidths addObject:[NSNumber numberWithUnsignedInteger:0]];
      else
        [minimumWidths addObject:[NSNumber numberWithUnsignedInteger:j==0?[cell.contents length]:0]];
  }
  return [minimumWidths copy];
}

- (NSString *)descriptionForColumnWidths:(NSArray *)columnWidths
{
  NSMutableString * description = [NSMutableString string];
  NSAssert([columnWidths count]>=[_cells count], @"Insufficient widths");
  NSUInteger logicalWidth = 0;
  for (ASCIICell * cell in _cells) logicalWidth += cell.colSpan;
  NSAssert([columnWidths count]>=logicalWidth, @"Too many columns spanned. I have become confused.");

  NSUInteger cellCount = [_cells count];
  NSUInteger colCount = [columnWidths count];
  NSUInteger widthForCell;
  for (NSUInteger cellIdx = 0, colIdx = 0;
       cellIdx < cellCount && colIdx < colCount;
       ++cellIdx) {
    widthForCell = 0;
    ASCIICell * cell = [_cells objectAtIndex:cellIdx];
    for (NSUInteger i = 0; i < cell.colSpan; ++i)
      widthForCell += [[columnWidths objectAtIndex:colIdx++] unsignedIntegerValue];
    widthForCell += cell.colSpan-1; // this simulates the single space between columns
    [description appendFormat:@"%@%@",
     [cell descriptionWithWidth:widthForCell],
     cellIdx==cellCount-1?@"":@" "
    ];
  }
  return [description mutableCopy];
}

- (id)init
{
  self = [super init];
  if (self) {
    _cells = [[NSMutableArray alloc] init];
  }
  return self;
}

@end

@implementation ASCIICell

@synthesize contents=_contents;
@synthesize align=_align;
@synthesize colSpan=_colSpan;
@synthesize ignoreWidth=_ignoreWidth;

+ (id)cellWithString:(NSString *)contents align:(enum ASCIIAlign)align
{
  ASCIICell * cell = [[[self class] alloc] init];
  if (cell) {
    cell.contents = contents;
    cell.align = align;
  }
  return cell;
}

+ (id)cellWithString:(NSString *)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  ASCIICell * cell = [[[self class] alloc] init];
  if (cell) {
    cell.contents = contents;
    cell.align = align;
    cell.colSpan = colSpan;
    cell.ignoreWidth = ignoreWidth;
  }
  return cell;
}

+ (id)cellWithDouble:(double)contents align:(enum ASCIIAlign)align
{
  ASCIICell * cell = [[[self class] alloc] init];
  if (cell) {
    cell.contents = [NSString stringWithFormat:@"%f", contents];
    cell.align = align;
  }
  return cell;
}

+ (id)cellWithDouble:(double)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  ASCIICell * cell = [[[self class] alloc] init];
  if (cell) {
    cell.contents = [NSString stringWithFormat:@"%f", contents];
    cell.align = align;
    cell.colSpan = colSpan;
    cell.ignoreWidth = ignoreWidth;
  }
  return cell;
}

+ (id)cellWithInteger:(NSInteger)contents align:(enum ASCIIAlign)align
{
  ASCIICell * cell = [[[self class] alloc] init];
  if (cell) {
    cell.contents = [NSString stringWithFormat:@"%ld", contents];
    cell.align = align;
  }
  return cell;
}

+ (id)cellWithInteger:(NSInteger)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  ASCIICell * cell = [[[self class] alloc] init];
  if (cell) {
    cell.contents = [NSString stringWithFormat:@"%ld", contents];
    cell.align = align;
    cell.colSpan = colSpan;
    cell.ignoreWidth = ignoreWidth;
  }
  return cell;
}

+ (id)cellWithUnsignedInteger:(NSUInteger)contents align:(enum ASCIIAlign)align
{
  ASCIICell * cell = [[[self class] alloc] init];
  if (cell) {
    cell.contents =  [NSString stringWithFormat:@"%lu", contents];
    cell.align = align;
  }
  return cell;
}

+ (id)cellWithUnsignedInteger:(NSUInteger)contents align:(enum ASCIIAlign)align colSpan:(NSUInteger)colSpan shouldIgnoreWidth:(BOOL)ignoreWidth
{
  ASCIICell * cell = [[[self class] alloc] init];
  if (cell) {
    cell.contents = [NSString stringWithFormat:@"%lu", contents];
    cell.align = align;
    cell.colSpan = colSpan;
    cell.ignoreWidth = ignoreWidth;
  }
  return cell;
}

- (NSString *)descriptionWithWidth:(NSUInteger)width
{
  NSAssert(width>=[_contents length], @"Truncation error.");
  NSMutableString * description = [_contents mutableCopy];
  NSUInteger prepend;
  NSUInteger append;
  switch (_align) {
  default:
  case kLeft:
    for (NSUInteger i = [description length];
         i < width;
         ++i)
      [description appendString:@" "];
    break;
  case kCenter:
    prepend = (width-[description length])/2;
    append = width-([description length]+prepend);
    for (NSUInteger i = 0; i < prepend; ++i) [description insertString:@" " atIndex:0];
    for (NSUInteger i = 0; i < append; ++i) [description appendString:@" "];
    break;
  case kRight:
    for (NSUInteger i = [description length];
         i < width;
         ++i)
      [description insertString:@" " atIndex:0];
    break;
  }
  return [description copy];
}

- (id)init
{
  self = [super init];
  if (self) {
    self.contents = @"";
    self.align = kLeft;
    self.colSpan = 1;
    self.ignoreWidth = NO;
  }
  return self;
}

@end
