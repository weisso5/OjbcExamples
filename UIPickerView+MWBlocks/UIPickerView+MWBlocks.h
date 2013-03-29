//
//  UIPickerView+MWBlocks.h
//
//
//  Created by Michael Weissman on 3/27/13.
//  Copyright (c) 2013 Michael Weissman. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

#if defined(__clang)

#if !defined(__has_feature)
#error This version of clang does not support __has_feature
#endif

#if !__has_feature(objc_arc)
#warning "This category depends on ARC for memory management"
#endif

#endif

typedef void(^PickerSelectionBlock)(id selectedValue);

#define kUIPickerViewMWPickerSectionWidth 300.0


@interface UIPickerView (MWPicker) <UIPickerViewDelegate,NSCopying>
{

}

+(UIPickerView *)pickerFromDataSource:(NSArray *)dataSource onSelection:(PickerSelectionBlock)sb;

-(id)copyWithZone:(NSZone *)zone;
-(NSNumber *)objectAtIndex:(NSInteger)idx;
-(NSInteger)objectCount;

@property (nonatomic,copy)PickerSelectionBlock selectionBlock;
@property (nonatomic,copy)NSArray *localDataSource;

@end
